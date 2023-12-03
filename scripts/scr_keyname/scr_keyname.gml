function scr_keyname(_key)
{
	switch (_key)
	{
		case vk_up:
			return lang_get_value("key_up");
			break;
		case vk_right:
			return lang_get_value("key_right");
			break;
		case vk_left:
			return lang_get_value("key_left");
			break;
		case vk_down:
			return lang_get_value("key_down");
			break;
		case vk_enter:
			return "ENTER";
			break;
		case vk_escape:
			return "ESCAPE";
			break;
		case vk_space:
			return "SPACE";
			break;
		case vk_rshift:
			return "SHIFT";
			break;
		case vk_lshift:
			return "SHIFT";
			break;
		case vk_shift:
			return "SHIFT";
			break;
		case vk_control:
			return "CONTROL";
			break;
		case vk_lcontrol:
			return "CONTROL";
			break;
		case vk_rcontrol:
			return "CONTROL";
			break;
		case vk_alt:
			return "ALT";
			break;
		case vk_lalt:
			return "ALT";
			break;
		case vk_backspace:
			return "BACKSPACE";
			break;
		case vk_tab:
			return "TAB";
			break;
		case vk_home:
			return "HOME";
			break;
		case vk_end:
			return "END";
			break;
		case vk_delete:
			return "DELETE";
			break;
		case vk_insert:
			return "INSERT";
			break;
		case vk_pageup:
			return "PAGE UP";
			break;
		case vk_pagedown:
			return "PAGE DOWN";
			break;
		case vk_pause:
			return "PAUSE";
			break;
		case vk_printscreen:
			return "PRINTSCREEN";
			break;
		case vk_f1:
			return "F1";
			break;
		case vk_f2:
			return "F2";
			break;
		case vk_f3:
			return "F3";
			break;
		case vk_f4:
			return "F4";
			break;
		case vk_f5:
			return "F5";
			break;
		case vk_f6:
			return "F6";
			break;
		case vk_f7:
			return "F7";
			break;
		case vk_f8:
			return "F8";
			break;
		case vk_f9:
			return "F9";
			break;
		case vk_f10:
			return "F10";
			break;
		case vk_f11:
			return "F11";
			break;
		case vk_f12:
			return "F12";
			break;
		case vk_numpad0:
			return "NUMPAD 0";
			break;
		case vk_numpad1:
			return "NUMPAD 1";
			break;
		case vk_numpad2:
			return "NUMPAD 2";
			break;
		case vk_numpad3:
			return "NUMPAD 3";
			break;
		case vk_numpad4:
			return "NUMPAD 4";
			break;
		case vk_numpad5:
			return "NUMPAD 5";
			break;
		case vk_numpad6:
			return "NUMPAD 6";
			break;
		case vk_numpad7:
			return "NUMPAD 7";
			break;
		case vk_numpad8:
			return "NUMPAD 8";
			break;
		case vk_numpad9:
			return "NUMPAD 9";
			break;
		case vk_multiply:
			return "MULTIPLY";
			break;
		case vk_divide:
			return "DIVIDE";
			break;
		case vk_add:
			return "ADD";
			break;
		case vk_subtract:
			return "SUBTRACT";
			break;
		case vk_decimal:
			return "DECIMAL";
			break;
		case -1:
			return lang_get_value("option_press_key");
			break;
	}
	
	switch (_key)
	{
        case vk_backspace:
            return "BACKSPACE";
        case 9:
            return "TAB";
        case vk_enter:
            return "ENTER";
        case vk_pause:
            return "PAUSE";
        case 20:
            return "CAPS LOCK";
        case vk_escape:
            return "ESC";
        case vk_space:
            return "SPACE";
        case vk_pageup:
            return "PAGEUP";
        case vk_pagedown:
            return "PAGEDOWN";
        case vk_end:
            return "END";
        case vk_home:
            return "HOME";
        case vk_left:
            return "LEFT";
        case vk_up:
            return "UP";
        case vk_right:
            return "RIGHT";
        case vk_down:
            return "DOWN";
        case vk_insert:
            return "INSERT";
        case vk_delete:
            return "DELETE";
        case 48:
            return "0";
        case 49:
            return "1";
        case 50:
            return "2";
        case 51:
            return "3";
        case 52:
            return "4";
        case 53:
            return "5";
        case 54:
            return "6";
        case 55:
            return "7";
        case 56:
            return "8";
        case 57:
            return "9";
        case 65:
            return "A";
        case 66:
            return "B";
        case 67:
            return "C";
        case 68:
            return "D";
        case 69:
            return "E";
        case 70:
            return "F";
        case 71:
            return "G";
        case 72:
            return "H";
        case 73:
            return "I";
        case 74:
            return "J";
        case 75:
            return "K";
        case 76:
            return "L";
        case 77:
            return "M";
        case 78:
            return "N";
        case 79:
            return "O";
        case 80:
            return "P";
        case 81:
            return "Q";
        case 82:
            return "R";
        case 83:
            return "S";
        case 84:
            return "T";
        case 85:
            return "U";
        case 86:
            return "V";
        case 87:
            return "W";
        case 88:
            return "X";
        case 89:
            return "Y";
        case 90:
            return "Z";
        case 91:
            return "LEXPLR";
        case 92:
            return "REXPLR";
        case vk_numpad0:
            return "NUMPAD 0";
        case vk_numpad1:
            return "NUMPAD 1";
        case vk_numpad2:
            return "NUMPAD 2";
        case vk_numpad3:
            return "NUMPAD 3";
        case vk_numpad4:
            return "NUMPAD 4";
        case vk_numpad5:
            return "NUMPAD 5";
        case vk_numpad6:
            return "NUMPAD 6";
        case vk_numpad7:
            return "NUMPAD 7";
        case vk_numpad8:
            return "NUMPAD 8";
        case vk_numpad9:
            return "NUMPAD 9";
        case vk_multiply:
            return "ASTERISK";
        case vk_add:
            return "ADD";
        case vk_subtract:
            return "DIVIDE";
        case vk_decimal:
            return "DOT";
        case vk_divide:
            return "SLASH";
        case vk_f1:
            return "F1";
        case vk_f2:
            return "F2";
        case vk_f3:
            return "F3";
        case vk_f4:
            return "F4";
        case vk_f5:
            return "F5";
        case vk_f6:
            return "F6";
        case vk_f7:
            return "F7";
        case vk_f8:
            return "F8";
        case vk_f9:
            return "F9";
        case vk_f10:
            return "F10";
        case vk_f11:
            return "F11";
        case vk_f12:
            return "F12";
        case 144:
            return "NUMLCK";
        case 145:
            return "SCROLLLCK";
        case vk_lshift:
            return "LSHIFT";
        case vk_rshift:
            return "RSHIFT";
        case vk_lcontrol:
            return "LCTRL";
        case vk_rcontrol:
            return "RCTRL";
        case vk_lalt:
            return "LALT";
        case vk_ralt:
            return "RALT";
        case 186:
            return "SEMICOLON";
        case 187:
            return "EQUAL";
        case 188:
            return "COMMA";
        case 189:
            return "UNDERSCR";
        case 190:
            return "DOT";
        case 191:
            return "SLASH";
        case 192:
            return "TILDE";
        case 219:
            return "LBRACKET";
        case 220:
            return "VERTBAR";
        case 221:
            return "RBRACKET";
        case 222:
            return "APOSTRPH";
    }
	return chr(_key);
}
