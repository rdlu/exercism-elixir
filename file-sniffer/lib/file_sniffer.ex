defmodule FileSniffer do
  def type_from_extension(extension) do
    case extension do
      "bmp" -> "image/bmp"
      "gif" -> "image/gif"
      "jpg" -> "image/jpg"
      "png" -> "image/png"
      "exe" -> "application/octet-stream"
      _ -> nil
    end
  end

  def type_from_binary(<<0x42, 0x4D, _::binary>>), do: type_from_extension("bmp")
  def type_from_binary(<<0x47, 0x49, 0x46, _::binary>>), do: type_from_extension("gif")
  def type_from_binary(<<0xFF, 0xD8, 0xFF, _::binary>>), do: type_from_extension("jpg")

  def type_from_binary(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary>>),
    do: type_from_extension("png")

  def type_from_binary(<<0x7F, 0x45, 0x4C, 0x46, _::binary>>), do: type_from_extension("exe")
  def type_from_binary(_), do: nil

  def verify(file_binary, extension) do
    type = type_from_extension(extension)

    if type_from_binary(file_binary) == type do
      {:ok, type}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
