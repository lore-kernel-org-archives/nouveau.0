From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70875] [NVC1] NOUVEAU(0): [drm] failed to set drm
 interface version
Date: Tue, 26 Nov 2013 05:59:28 +0000
Message-ID: <bug-70875-8800-slXbIhUxiK@http.bugs.freedesktop.org/>
References: <bug-70875-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1168775772=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70875-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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


--===============1168775772==
Content-Type: multipart/alternative; boundary="1385445568.F6F51332.12036"; charset="us-ascii"


--1385445568.F6F51332.12036
Date: Tue, 26 Nov 2013 05:59:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70875

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I don't see anything that suggests that you have a hardware mux. The VGA/DVI
connectors appear to be on the nvidia card -- they're inaccessible from intel,
right? (A bit hard to tell from your logs...)

So... please try the following:

linux 3.13-rc1 -- this has some fixes for nvc1 as well as runtime pm.

don't touch bumblebee
don't touch vga_switcheroo

The nvidia card should automatically suspend when you're not using its VGA/DVI
outputs (and not using it for 3d rendering).

If you now run

xrandr --setprovideroutputsource nouveau Intel

you should be able to use your intel card to show images on the
nvidia-connected screens. (You can also reverse this logic to use the nvidia
card as the 'main' card.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385445568.F6F51332.12036
Date: Tue, 26 Nov 2013 05:59:28 +0000
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
   title="NEW --- - [NVC1] NOUVEAU(0): [drm] failed to set drm interface version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70875#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] NOUVEAU(0): [drm] failed to set drm interface version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70875">bug 70875</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I don't see anything that suggests that you have a hardware mux. The VGA/DVI
connectors appear to be on the nvidia card -- they're inaccessible from intel,
right? (A bit hard to tell from your logs...)

So... please try the following:

linux 3.13-rc1 -- this has some fixes for nvc1 as well as runtime pm.

don't touch bumblebee
don't touch vga_switcheroo

The nvidia card should automatically suspend when you're not using its VGA/DVI
outputs (and not using it for 3d rendering).

If you now run

xrandr --setprovideroutputsource nouveau Intel

you should be able to use your intel card to show images on the
nvidia-connected screens. (You can also reverse this logic to use the nvidia
card as the 'main' card.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385445568.F6F51332.12036--

--===============1168775772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1168775772==--
