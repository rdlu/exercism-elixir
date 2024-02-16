defmodule PaintByNumber do
  def palette_bit_size(color_count, bits \\ 0) do
    if Integer.pow(2, bits) >= color_count do
      bits
    else
      palette_bit_size(color_count, bits + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::size(2), 1::size(2), 2::size(2), 3::size(2)>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(bit_size), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil

  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<pixel::size(bit_size), _rest::bitstring>> = picture

    pixel
  end

  def drop_first_pixel(<<>>, _), do: empty_picture()

  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_::size(bit_size), rest::bitstring>> = picture

    rest
  end

  def concat_pictures(<<>>, <<>>), do: empty_picture()

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
