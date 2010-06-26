From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Dual Head: 2nd monitor "Out of Range"
Date: Sat, 26 Jun 2010 13:14:58 -0400
Message-ID: <AANLkTilmW18Tz_h5vg4qERSGqt8tXyFNRWwvkgmgDUVI@mail.gmail.com>
References: <AANLkTilF2Xvikr_C5wsEq1DfqHIsa0FnB0mQ6d7HIVBW@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTilF2Xvikr_C5wsEq1DfqHIsa0FnB0mQ6d7HIVBW-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Elijah Smith <durableinnovations-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Jun 22, 2010 at 2:45 PM, Elijah Smith
<durableinnovations-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Having issues with Nouveau in Ubuntu 10.4. =A0I posted on the forums, but=
 the
> only help I have gotten had been people telling me to install the Blob
> (which is a P.O.S. in my opinion), so I have decided to ask the experts.
> =A0Prior to my HDD failing, I was running Ubuntu 9.10 with Nouveau instal=
led
> from the Edgers PPA without any issues. =A0When I replaced the HDD, I went
> ahead and did a clean install of 10.4 and was delighted to find Nouveau as
> the default driver... yay! =A0The only problem is that I seem to have an =
issue
> with dual heads. =A0I have a pretty new computer (as of January) with a 1=
GB
> Nvidia card that worked nicely with my previous Nouveau installation, so I
> know it should work with my setup. =A0I can get the laptop screen running=
 at
> its native 1600x900 without issue. =A0I can set the external monitor to i=
ts
> native 1920x1200, but the monitor only displays "Out of Range" when I do
> that. =A0In the Desktop Switcher, it appears as if it recognizes the 2nd
> monitor and I can move window onto it, but the monitor just does not disp=
lay
> an image. =A0The highest resolutions I can set the external monitor to and
> still get an image are 1440x900 or a strange=A01280x1024. =A0Not sure wha=
t's
> wrong here, but I would really like to see my external monitor at its nat=
ive
> resolution.
> Thoughts? =A0I know my way around the GUI pretty well, but I am mostly li=
mited
> to copy and paste in command line. =A0If you give me some command line to
> input, I can reply with the output. =A0Is there something I should try? =
=A0Any
> help would be greatly appreciated.
> Thanks in advance.
> -Eli
>
> --
> Eli Smith
> 540-808-8268
> durableinnovations-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

Your xorg.conf, Xorg log, and kernel log are a good place to look. Can
you reboot the machine and try to set the 2nd monitor to it's native
res? Once you do that you can grab your kernel log by doing the
following in a terminal:

dmesg >kernel.log

which will result in a file called kernel.log in your home dir.

After that attach kernel.log, /var/log/Xorg.0.log, and
/etc/X11/xorg.conf in your reply. You may not have /etc/X11/xorg.conf,
which is ok.
