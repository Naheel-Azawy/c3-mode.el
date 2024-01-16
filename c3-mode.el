;;; c3-mode.el --- Major mode for the C3 programming language  -*- lexical-binding: t; -*-

;;; Commentary:

;; Copyright 2022-present Naheel Azawy.  All rights reserved.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; Author: Naheel Azawy
;; Version: 1.0.0
;; Keywords: c3 languages
;; URL: https://github.com/Naheel-Azawy/c3-mode.el
;;
;; This file is not part of GNU Emacs.
;;; Code:



(defvar c3-font-lock-keywords
  (let* (
         ;; define several category of keywords
         (x-types '("void" "bool" "char" "double" "float" "float16" "int128" "ichar"
                    "int" "iptr" "isz" "long" "short" "uint128" "uint" "ulong" "uptr"
                    "ushort" "usz" "float128" "any" "anyfault" "typeid"))

         (x-keywords '("bitstruct" "break" "case" "catch" "const" "continue" "def"
                       "default" "defer" "distinct" "do" "else" "enum" "extern" "false"
                       "fault" "for" "foreach" "foreach_r" "fn" "tlocal" "if" "inline"
                       "import" "macro" "module" "nextcase" "null" "return" "static"
                       "struct" "switch" "true" "try" "union" "var" "while" "assert" "asm"

                       "$alignof" "$assert" "$case" "$checks" "$default" "$defined"
                       "$echo" "$exec" "$else" "$endfor" "$endforeach" "$endif"
                       "$endswitch" "$eval" "$evaltype" "$error" "$extnameof" "$for"
                       "$foreach" "$if" "$include" "$nameof" "$offsetof" "$qnameof"
                       "$sizeof" "$stringify" "$switch" "$typefrom" "$typeof" "$vacount"
                       "$vatype" "$vaconst" "$varef" "$vaarg" "$vaexpr" "$vasplat"))

         (x-attrs '("@align" "@benchmark" "@bigendian" "@builtin" "@cdecl" "@deprecated"
                    "@dynamic" "@export" "@extern" "@extname" "@inline" "@interface"
                    "@littleendian" "@local" "@maydiscard" "@naked" "@nodiscard"
                    "@noinit" "@noinline" "@noreturn" "@nostrip" "@obfuscate" "@operator"
                    "@overlap" "@packed" "@priority" "@private" "@public" "@pure"
                    "@reflect" "@section" "@stdcall" "@test" "@unused" "@used" "@veccall"
                    "@wasm" "@weak" "@winmain"))

         (x-constants '("$$BENCHMARK_FNS" "$$BENCHMARK_NAMES" "$$DATE" "$$FILE"
                        "$$FILEPATH" "$$FUNC" "$$FUNCTION" "$$LINE" "$$LINE_RAW"
                        "$$MODULE" "$$TEST_FNS" "$$TEST_NAMES" "$$TIME"
                        "this"))

         ;; generate regex string for each category of keywords
         (x-keywords-regexp  (regexp-opt x-keywords  'symbols))
         (x-types-regexp     (regexp-opt x-types     'symbols))
         (x-attrs-regexp     (regexp-opt x-attrs 'symbols))
         (x-constants-regexp (regexp-opt x-constants 'symbols)))

    `(
      (,x-keywords-regexp  . font-lock-keyword-face)
      (,x-types-regexp     . font-lock-type-face)
      (,x-attrs-regexp     . font-lock-preprocessor-face)
      (,x-constants-regexp . font-lock-constant-face)

      ("\\_<[0-9.]+\\_>"        . font-lock-constant-face)
      ("\\_<0x[0-9a-fA-F]+\\_>" . font-lock-constant-face)
      ("\\_<0o[0-7]+\\_>"       . font-lock-constant-face)
      ("\\_<0b[01]+\\_>"        . font-lock-constant-face)
      ))
  "C3 language keyword regexp for font-locking.")

;;;###autoload
(define-derived-mode c3-mode c-mode "C3"
  "Major mode for editing C3 files."
  (setq-local font-lock-defaults '((c3-font-lock-keywords))))

(add-to-list 'auto-mode-alist '("\\.c3\\'" . c3-mode))

(provide 'c3-mode)

;;; c3-mode.el ends here
