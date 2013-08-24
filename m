From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60680] [NV96] HDMI is connected and has mode,
 TV says "no signal"
Date: Sat, 24 Aug 2013 08:30:02 +0000
Message-ID: <bug-60680-8800-RWY6hFqfsj@http.bugs.freedesktop.org/>
References: <bug-60680-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0578804043=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60680-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0578804043==
Content-Type: multipart/alternative; boundary="1377333002.BDeeCB1.3418"; charset="us-ascii"


--1377333002.BDeeCB1.3418
Date: Sat, 24 Aug 2013 08:30:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60680

--- Comment #9 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
As preparing for bisection, here are new confirmed data points:

- 3.5.2 vanilla kernel (i.e. not Gentoo-patches) works.
- 3.11-rc6 vanilla kernel does not work.

I am specifically looking at whether boot-time fbcon after nouveau loads shows
up on HDMI, whether X by default shows up on HDMI, and can I get the HDMI
output exclusively.

On 3.5.2, fbcon is cloned, X by default is cloned, and HDMI exclusive works.

On 3.11-rc6, fbcon shows only on LVDS, X by default shows only on LVDS, and
HDMI exclusive does not show up anywhere. (off-topic: default resolution was
not native for LVDS anymore.)

The HDMI exclusive is set up by:
$ xrandr --output LVDS-1 --off --output HDMI-1 --mode 1920x1080 --set 'scaling
mode' 'None'

I did also try dual setup:
$ xrandr --output LVDS-1 --auto --output HDMI-1 --mode 1920x1080 --set 'scaling
mode' 'None' --right-of LVDS-1
but that does not work even on 3.5.2, LVDS works but TV says no signal.
Apparently something in manual dual-screen setup gets messed up, while boot-up
dual screen works. But that is off-topic here.

Therefore, my bisection will concentrate on whether HDMI exclusive at full-HD
resolution works or not.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377333002.BDeeCB1.3418
Date: Sat, 24 Aug 2013 08:30:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] HDMI is connected and has mode, TV says &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60680">bug 60680</a>
              from <span class="vcard"><a class="email" href="mailto:ppaalanen&#64;gmail.com" title="Pekka Paalanen &lt;ppaalanen&#64;gmail.com&gt;"> <span class="fn">Pekka Paalanen</span></a>
</span></b>
        <pre>As preparing for bisection, here are new confirmed data points:

- 3.5.2 vanilla kernel (i.e. not Gentoo-patches) works.
- 3.11-rc6 vanilla kernel does not work.

I am specifically looking at whether boot-time fbcon after nouveau loads shows
up on HDMI, whether X by default shows up on HDMI, and can I get the HDMI
output exclusively.

On 3.5.2, fbcon is cloned, X by default is cloned, and HDMI exclusive works.

On 3.11-rc6, fbcon shows only on LVDS, X by default shows only on LVDS, and
HDMI exclusive does not show up anywhere. (off-topic: default resolution was
not native for LVDS anymore.)

The HDMI exclusive is set up by:
$ xrandr --output LVDS-1 --off --output HDMI-1 --mode 1920x1080 --set 'scaling
mode' 'None'

I did also try dual setup:
$ xrandr --output LVDS-1 --auto --output HDMI-1 --mode 1920x1080 --set 'scaling
mode' 'None' --right-of LVDS-1
but that does not work even on 3.5.2, LVDS works but TV says no signal.
Apparently something in manual dual-screen setup gets messed up, while boot-up
dual screen works. But that is off-topic here.

Therefore, my bisection will concentrate on whether HDMI exclusive at full-HD
resolution works or not.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377333002.BDeeCB1.3418--

--===============0578804043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0578804043==--
