From: "Pascal Schoenhardt" <stoanhart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: NV43 (6600 Go) Report
Date: Tue, 15 May 2007 11:23:50 +0100
Message-ID: <438b0cc70705150323q2356c42flb70d4f0675bbc478@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi everyone,

My name is Pascal Schoenhardt. I am working on a SOC project to add
XRandR 1.2 support to GNOME, and I use a laptop with an Nvidia card.
Therefore, I also use Nouveau.

First of all, great work guys. I am extremely excited about this
project, and I'm amazed by the progress you are making with such a
difficult task. I am posting this message to report my success with
the nouveau driver (GIT version from the 12'th of May), and to ask for
support on one thing. So, here we go:

Driver compiled just fine, and everything worked on the first try. The
"Start X and run for cover" was not required! glxgears runs at approx.
350 fps; this is according to the console output, however the
animation looks very jumpy... According to the wiki, this is the only
3D application that runs, however I am also able to use every one of
the GL screensavers included in Gnome (2.20, I believe - running
Feisty). They run like slideshows, but they render perfectly! Nice
work. The only other GL app I've tried is Google Earth, which resulted
in X crashing, but I know that advanced apps aren't meant to work yet
anyways.

Now for the problems: My laptop is an Asus Z71v, which has a 1680x1050
LCD panel. While I am running Feisty Fawn, which has x.org 7.2 by
default, I have upgraded this to 7.3 from Burtoni's repo's, which were
create with the intent of testing display hotplugging.

When I first started up nouveau, I only had 1024x768. xrandr reported
that screen 0 had a minimum of 640x480, a max of 1024x768, and was
connected at 1024x768. My output was labeled "default" (not LVDS) and
was connected at 1024x768. Trying to change the screen size with the
--fb option was not successful.

A bit of Googling lead me to adding:
    Virtual  1680  1050
to the Screen -> Display subsection in my xorg.conf. This increased
the screen size to 1680x1050, however my LCD was still at 1024x768,
allowing me to pan around. The strange thing was that the "default"
output was registering itself to be running at 1680x1050. It seems
nouveau tried changing my LCD to its native res, and thought it
succeeded, when it really didn't. At this point, I could use the --fb
command to lower the resolution, but not increase it. Also, changing
the resolution like that caused X to crash sometimes, and some other
GNOME related issues other times (nautilus crashing).

My next step was to try some modelines. After 4 attempts, I found this
one to work:
   ModeLine "1680x1050" 144.02 1680 1784 1968 2256 1050 1051 1054 1064
Now I have full resolution. The output of running 'xrandr' right now is:

Screen 0: minimum 640 x 480, current 1680 x 1050, maximum 1680 x 1050
default connected 1680x1050+0+0 0mm x 0mm
   1680x1050      60.0*
   1024x768       60.0
   800x600        60.0     56.0
   640x480        60.0
   1280x1024      60.0
   1440x900       60.0
   1280x960       60.0
   1280x800       60.0
   1280x768       60.0
   1152x768       55.0

Now, here is the real issue: My laptop has a VGA port and an svideo
port. To start working on smooth multi-head support for gnome, I
obviously need use of at least the VGA port. As it stands, nouveau
does not detect any of these outputs. As I understand it, xrandr
should be reporting something like this:

Screen 0: minimum 640 x 480, current 1680 x 1050, maximum 1680 x 1050
LVDS connected 1680x1050+0+0 0mm x 0mm
VGA not connected
SVideo not connected
...

Plugging in a monitor in the VGA port does nothing at all. I did
notice that there are some other heads in the GIT repository for
xrandr1.2. Do I maybe need to get a special version of nouveau? Has
the randr stuff been merged into the main driver yet? If I need a
special version, I would be forever grateful if someone could just
post the exact git command I need to run to get what I need. :)

So, I appologize for the length of this report. I hope it provides one
of you developers with something useful!

Cheers,

Pascal
