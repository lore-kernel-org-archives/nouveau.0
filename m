From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: vdpau problems and logging
Date: Thu, 14 Mar 2013 10:56:59 +0100
Message-ID: <51419EEB.4010806@canonical.com>
References: <CADXEQv_oL6zh4mzpWsd-gH5fcm05vCothJe-CsT0O11kBwzfag@mail.gmail.com>
	<514170D3.90102@canonical.com>
	<CADXEQv9sMiwwzdbdi13TvX_S6sWyfSjejrBd2w7y-5pEp3CkDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CADXEQv9sMiwwzdbdi13TvX_S6sWyfSjejrBd2w7y-5pEp3CkDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Steven Ward <nightcast2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Op 14-03-13 10:47, Steven Ward schreef:
> Hi Maarten,
>                   I'm sure  I have downloaded  and installed the latest
> libvdpau firmware from git.. I will check the git repository for Mesa and
> re-compile it again. I will invoke the git version of Mesa with "nvgl" wh=
en
> I start the video players again.
Are you sure it's picking up the right vdpau_nouveau though? Maybe your dis=
tro has one in path, you could try strace to see where it gets libvdpau_nou=
veau.so from.
> The way I got the mmiotradce is this: I downloaded and installed the 313
> blob for my Chakra default kernel " sudo pacman -S nvidia"
>
> I rebooted back to the desktop. I then logged out and ended up at KDM. I
> then selected "console login" from the KDM settings there. When I got a
> prompt, I pressed "Alt+Ctrl+F3"
> to get myself to "tty 3" it was the only way to get there with my Chakra
> installation,as I've tried to invoke "init 3" from the advanced kernel
> options with no success.
>
> Anyway, I invoked " su" my password,then "sudo echo mmiotrace >
> /sys/kernel/debug/tracing/current_tracer *return*
>
> Then I ran " sudo cat /sys/kernel/debug/tracing/trace_pipe 2>&1 =A6 tee
> /home/steve/video-dump.txt & startx"  Then X started up and I saw the
> nvidia logo flash as well.
>
> I then went onto konsole and ran the mplayer command string with the mkv
> file from beginning to end (the video was roughly 24 minutes) After the
> video had finished and had caught a trace. I logged back out again,and
> stopped the mmiotrace from the tty 3 console.
>
You don't need to play an actual video, just having mplayer initialize vide=
o is enough.

The nvidia module must be unloaded before you start your mmiotrace, easiest=
 is to ssh into the machine.

The script I'm using for mmiotrace is:

http://people.freedesktop.org/~mlankhorst/mmiotrace-nvidia.sh

Connect to the machine with ssh, make sure your display manager is stopped,=
 and nvidia module is unloaded,
then run the script and in the shell it spawns, type:

/usr/bin/X :0

sleep 5 # if you copy paste, give it some time to init, if not just skip th=
is and wait 5 seconds

DISPLAY=3D:0 envytools/vdpow/mmt_ufw
# check if it returns any errors like unable to connect to display, if not =
you're good

exit 0

The mmiotrace should be in /tmp/current_trace.txt now, and have all the ker=
nel firmwares you need.

~Maarten
