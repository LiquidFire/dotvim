if has("win32")
    ruby <<EOF
        $:.concat [
            "C:/Ruby187/lib/ruby/site_ruby/1.8",
            "C:/Ruby187/lib/ruby/site_ruby/1.8/i386-msvcrt",
            "C:/Ruby187/lib/ruby/site_ruby",
            "C:/Ruby187/lib/ruby/vendor_ruby/1.8",
            "C:/Ruby187/lib/ruby/vendor_ruby/1.8/i386-msvcrt",
            "C:/Ruby187/lib/ruby/vendor_ruby",
            "C:/Ruby187/lib/ruby/1.8",
            "C:/Ruby187/lib/ruby/1.8/i386-mingw32",]
EOF
endif
