From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nvidia gt 545 and nouveau
Date: Fri, 6 Apr 2012 07:51:26 +0200
Message-ID: <CAGZ4FEROXAbm1+xMV+bLwx1SZQkwVsza15OXhMVJH+KVUa1COA@mail.gmail.com>
References: <20120405002512.GA1517@Daniel-Tower>
	<CAGZ4FES5fKnRSDVR6f9rLwKuHMr-57-8nWX5UOyeQzvDNo+bMA@mail.gmail.com>
	<20120405082446.GA687@Daniel-Tower>
	<20120405223625.GA672@Daniel-Tower>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120405223625.GA672@Daniel-Tower>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Daniel Wallace <daniel.wallace-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Apr 6, 2012 at 12:36 AM, Daniel Wallace
<daniel.wallace-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org> wrote:
> here are my some logs if anyone is interested
> Xorg.0.log http://sprunge.us/CIgO?text
> dmesg http://sprunge.us/cegQ?text
>
> and
> Xorg.0.log after applying this patch
> http://permalink.gmane.org/gmane.comp.freedesktop.xorg.devel/29650
>
> http://sprunge.us/LMjV?text
>
>
> here is all the information I get from inxi -F
> http://sprunge.us/TOef
> any help would be appreciated,
> Thank you,
> Daniel Wallace
>
> On Thu, Apr 05, 2012 at 04:24:46AM -0400, Daniel Wallace wrote:
>> On Thu, Apr 05, 2012 at 08:46:01AM +0200, Maarten Maathuis wrote:
>> > On Thu, Apr 5, 2012 at 2:25 AM, Daniel Wallace
>> > <daniel.wallace-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org> wrote:
>> > > I have 2 monitors plugged into the same nvidia card
>> > > (running nouveau) one can be either DVI-I or VGA(vga right now) and =
the
>> > > other is hdmi, right now, I am just trying to get the monitors to not
>> > > be clones of each other and to be side by side. When i do xrandr
>> > > --output HDMI-1 --pos 0x0 --output VGA-1 --auto --right-of HDMI-1, t=
he
>> > > whole screen freezes with the mouse in between the 2 monitors and I
>> > > can't do anything except kill the power and reboot, Anyone have any
>> > > ideas where to start, because I have looked for several hours now an=
d I
>> > > can't find anything that would be causing this issue.
>> > >
>> > > What happens when It freezes is the mouse literally gets stuck in
>> > > between the two screens (half on either screen) and since I am unable
>> > > to do any commands with the keyboard I can't take a screen shot. =A0I
>> > > would really like to be able to use nouveau and xrandr, because I do=
n't
>> > > really want to use Xinerama with the proprietary drivers because the=
n I
>> > > am unable to use compositing.
>> > >
>> > > Any thoughts and questions would be greatly appreciated.
>> > >
>> > > Thanks,
>> > > Daniel Wallace
>> > >
>> > > _______________________________________________
>> > > Nouveau mailing list
>> > > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> > > http://lists.freedesktop.org/mailman/listinfo/nouveau
>> > >
>> >
>> > What happens if you want to set the framebuffer size to the size of
>> > your two monitors combined?
>> >
>> > 1280x1024+1280x1024 would be:
>> > xrandr --fb 2560x1024
>> >
>> > Afterwards xrandr should say "current 2560x1024" somewhere at the
>> > beginning of it's output.
>> >
>> > I assume your two monitors work in clone, so i i'm wondering if it's
>> > the framebuffer allocation that causes the problem.
>> >
>> > --
>> > Far away from the primal instinct, the song seems to fade away, the
>> > river get wider between your thoughts and the things we do and say.
>>
>> with xrandr --fb 3840x1080 then
>> xrandr --output HDMI-1 --pos 0x0 --output VGA-1 --right-of HDMI-1
>>
>> it now shows both screens, and everything looks fine, except for the
>> fact that the mouse is on the border of both screens, half on both and
>> I can't move it or have any keyboard actions, just have to reboot the
>> computer
>
>

Based on the xorg log this looks like some kind cursor/mouse/input
related bug. Its probably a good idea to try either the xorg
mailinglist or simply file a bug. You should do something like:

If you ask on the mailinglist i would put this ("BUG: triggered 'if
(!dev->valuator || dev->valuator->numAxes < 2)' BUG: getevents.c:845
in scale_to_desktop()") in the title, this hopefully triggers whoevers
knows what the problem could be to look at it.

-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
