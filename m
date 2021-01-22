From: o1bigtenor <o1bigtenor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Request for help in adding a HDMI output
Date: Thu, 21 Jan 2021 20:58:55 -0600
Message-ID: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Greetings

Running a debian testing system
$ uname -r
5.4.0-4-amd64
with 2 graphics cards.
The one I'm working on is a: GP 107 Nvidia  GTX 1050 Ti

Asus ROG GeForce GX 1050 Ti Strix-GTX1050 Ti with 2 - DVI plus 1 DP1.4
and I HDMI2.0 ports (four in total).

I have been running 2 1920x1080 monitors on this card (and its
previous nvidia 570) for quite some time. Been running nouveau for the
last about 4 years as my last nvidia 570 (started with 3) is EOL by
nvidia.
Have gotten quite comfortable using xrandr setting up the second card
(the nvidia 570) and its 2 monitors. Nouveau software is:
xserver-xorg-video-nouveau -> 1:1.0.16-1 ;
xserver-xorg -> 1:7.7+21 ; and libdrm-nouveau2:amd64 -> 2.4.102-1 .

I want to add a 4k TV onto the HDMI port on card #1.
Can't seem to get the card and the TV talking.
Tried a number of things in xrandr:

$ xrandr
Screen 0: minimum 320 x 200, current 3840 x 3000, maximum 16384 x 16384
DVI-D-1 connected primary 1920x1080+0+1920 (normal left inverted right
x axis y axis) 477mm x 268mm

HDMI-1 disconnected (normal left inverted right x axis y axis)
DP-1 connected 1920x1080+1920+1920 (normal left inverted right x axis
y axis) 477mm x 268mm
DVI-I-1-1 connected 1920x1080+1080+0 inverted (normal left inverted
right x axis y axis) 477mm x 268mm
DVI-I-1-2 connected 1080x1920+0+0 left (normal left inverted right x
axis y axis) 477mm x 268mm

HDMI-1-2 connected (normal left inverted right x axis y axis)
   1920x1080     59.97    59.96    60.00    50.00    59.94    59.93
30.00    25.00    24.00    29.97    23.98

DP-1-2 disconnected (normal left inverted right x axis y axis)

Screen 0: minimum 320 x 200, current 3840 x 3000, maximum 16384 x 16384
DVI-D-1 connected primary 1920x1080+0+1920 (normal left inverted right
x axis y axis) 477mm x 268mm

HDMI-1 disconnected (normal left inverted right x axis y
Screen 0: minimum 320 x 200, current 3840 x 3000, maximum 16384 x 16384
DVI-D-1 connected primary 1920x1080+0+1920 (normal left inverted right
x axis y axis) 477mm x 268mm
HDMI-1 disconnected (normal left inverted right x axis y axis)
DP-1 connected 1920x1080+1920+1920 (normal left inverted right x axis
y axis) 477mm x 268mm
DVI-I-1-1 connected 1920x1080+1080+0 inverted (normal left inverted
right x axis y axis) 477mm x 268mm
DVI-I-1-2 connected 1080x1920+0+0 left (normal left inverted right x
axis y axis) 477mm x 268mm
HDMI-1-2 connected (normal left inverted right x axis y axis)
   1920x1080     59.97    59.96    60.00    50.00    59.94    59.93
30.00    25.00    24.00    29.97    23.98
DP-1-2 disconnected (normal left inverted right x axis y axis)
   end 2248 total 2576 skew    0 clock  67.16KHz
        v: height 1080 start 1083 end 1088 total 1120           clock  59.96Hz

  3840x2160_60.00 (0x6ce) 712.750MHz -HSync +VSync
        h: width  3840 start 4160 end 4576 total 5312 skew    0 clock 134.18KHz
        v: height 2160 start 2163 end 2168 total 2237           clock  59.98Hz

        h: width   960 start 1008 end 1040 total 1120 skew    0 clock  33.26KHz
        v: height  540 start  543 end  548 total  556           clock  59.82Hz

  3840x2160_60.00 (0x6ce) 712.750MHz -HSync +VSync
        h: width  3840 start 4160 end 4576 total 5312 skew    0 clock 134.18KHz
        v: height 2160 start 2163 end 2168 total 2237           clock
59.98Hz axis)
DP-1 connected 1920x1080+1920+1920 (normal left inverted right x axis
y axis) 477mm x 268mm

DVI-I-1-1 connected 1920x1080+1080+0 inverted (normal left inverted
right x axis y axis) 477mm x 268mm
DVI-I-1-2 connected 1080x1920+0+0 left (normal left inverted right x
axis y axis) 477mm x 268mm

HDMI-1-2 connected (normal left inverted right x axis y axis)
   1920x1080     59.97    59.96    60.00    50.00    59.94    59.93
30.00    25.00    24.00    29.97    23.98

I've tried turning HDMI-1-2 off; turning HDMI-1-2 on;
# cvt 3840 2160
# 3840x2160 59.98 Hz (CVT 8.29M9) hsync: 134.18 kHz; pclk: 712.75 MHz
Modeline "3840x2160_60.00"  712.75  3840 4160 4576 5312  2160 2163
2168 2237 -hsync +vsync
root@memyself:/# gtf 3840 2160

usage: gtf x y refresh [-v|--verbose] [-f|--fbmode] [-x|--xorgmode]

            x : the desired horizontal resolution (required)
            y : the desired vertical resolution (required)
      refresh : the desired refresh rate (required)
 -v|--verbose : enable verbose printouts (traces each step of the computation)
  -f|--fbmode : output an fbset(8)-style mode description
 -x|--xorgmode : output an Xorg-style mode description (this is the default
                if no mode description is requested)

# exit
logout
memyself@debianone:~$ xrandr --newmode "3840x2160_60.00"  712.75  3840
4160 4576 5312  2160 2163 2168 2237 -hsync +vsync
memyself@debianone:~$ xrandr --addmode HDMI-1-2 3840x2160_60.00
memyself@debianone:~$ xrandr --output HDMI-1-2 --mode 3840x2160_60.00
xrandr: cannot find crtc for output HDMI-1-2


One possibility - - - - screen 0 is only 3840 x 3000 (which covers the
previous 4 monitors).
  I think I need to stretch screen 0 to 7680 x 3000 for starters.

What else do I need to do to get the hdmi port talking to the TV?

TIA

(Hopefully the question is not inappropriate is so please advise!!!!
If more information is needed please advise!!)
