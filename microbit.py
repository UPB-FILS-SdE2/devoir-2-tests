A = 0
B = 1
class Display:
    leds = [0] * 25

    def set_pixel (self, x, y, value):
        if value >= 0 and value <= 9 and x >= 0 and x <= 4 and y >= 0 and y <= 4:
            self.leds [y*5+x] = value
            print ('Set pixel {} {} to {}'.format(x, y, value))
        else:
            raise Exception ('Invalid display.set_pixel call')
    
    def get_pixel (self, x, y):
        if x >= 0 and x <= 4 and y >= 0 and y <= 4:
            return self.leds [y*5+x]
        else:
            raise Exception ('Invalid display.get_pixel call')
    
    def read_light_level (self):
        return 125

class  Button:
    def __init__(self, button):
        self.button = button
    def is_pressed (self):
        if self.button == A:
            return True
        return False

display = Display()
button_a = Button (A)
button_b = Button (B)

def sleep (ms):
    print ('Sleep for {} ms'.format (ms))

def temperature ():
    return 24
