From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: missing text and icons with NV25
Date: Thu, 31 Dec 2009 01:41:11 +0100
Message-ID: <91752840912301641y140ac4dex4caced11e35a95e4@mail.gmail.com>
References: <91752840912240112ud844995ub24afadfd9edbf5f@mail.gmail.com>
	<1262204506.8519.0@ffortso4>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1262204506.8519.0@ffortso4>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jack <ostroffjh-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Dec 30, 2009 at 9:21 PM, Jack <ostroffjh-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org> wrote:
> On 2009.12.24 04:12, Xavier wrote:
>>
>> On Thu, Dec 24, 2009 at 12:29 AM, Jack <ostroffjh-rphTv4pjVZMJGwgDXS7ZQA@public.gmane.org> wrote:
>>>
>>> I'm using nouveau xf86-video-nouveau 0.0.10_git20091101-1 and nouveau-d=
rm
>>> 0.0.15_20091120-1 under Arch Linux with xorg-server 1.7.3.901-1. =A0My =
video
>>> card is recognized as "nVidia Corporation NV25GL [Quadro4 750 XGL]".
>>
>> I am not sure there has been a lot of changes for nv25, but 1-2 months c=
an
>> be a lot in nouveau development. You should try newer packages first. Btw
>> arch has up-to-date nouveau packages in testing (built for kernel 2.6.32
>> also in testing). They should move soon but you can always try them now.
>
> It looks like some updates just hit, so I now have xf86-video-nouveau
> 0.0.10_git20091221-1 and nouveau-drm 0.0.15_20091220-1 with kernel26
> 2.6.32.2-2 and xorg-server 1.7.3.902-1. =A0Missing icons and fonts, and s=
ome
> apparent screen corruption as I'm exiting X.
>
> I still have to enable getting newer packages from testing, but these sti=
ll
> give the same problem. =A0I suppose I could also set up to compile from g=
it,
> if necessary to test bleeding edge or specific patches.
>
>>> X starts (with no apparent errors) but it's essentially unusable, since
>>> it's missing all the icons on all the panels and toolbars, and no text =
shows
>>> up at all. =A0For example, I can start an xterm, since I know where the=
 icon
>>> is on the panel, and I can type commands, which by the cursor movement =
seem
>>> to be working correctly, but there is no visible text in the term. =A0P=
opups
>>> (such as right-clicking on the main window) have some clutter/video noi=
se -
>>> but no text or icons. =A0I see no obvious error messages in the log or =
dmesg.
>>> ....
>
>> If newer packages do not work, you should definitely post dmesg and Xorg
>> log. About xorg.conf , if you have a complex one, you could try with a
>> minimalistic one first. See
>> http://nouveau.freedesktop.org/wiki/InstallNouveau or
>> http://wiki.archlinux.org/index.php/Nouveau#Configuration
>
> Post here? =A0As attachments or inline? =A0(dmesg is just under 500 lines=
 and
> Xorg log is just under 400.)
>
> I don't have much of an xorg.conf, but even with the minimal one I get the
> same behavior.
>
> Thanks for your help.
>

Either attach here, or maybe open a new bug report and add the
attachments there :
http://nouveau.freedesktop.org/wiki/FrontPage#Bugs
