#![no_main]
use libfuzzer_sys::fuzz_target;
use polars::prelude::*;

fuzz_target!(|data: &[u8]| {
    let mut reader = std::io::Cursor::new(data);
    let _ = ParquetReader::new(reader).finish();
});
