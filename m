From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79266] [NVC1] GT 430 / GF108 sluggish,
 unstable performance and blue tint with vdpau
Date: Mon, 26 May 2014 18:35:01 +0000
Message-ID: <bug-79266-8800-ljGCrRpje0@http.bugs.freedesktop.org/>
References: <bug-79266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0419162797=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79266-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0419162797==
Content-Type: multipart/alternative; boundary="1401129300.0FdCd3fd2.2512"; charset="us-ascii"


--1401129300.0FdCd3fd2.2512
Date: Mon, 26 May 2014 18:35:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79266

--- Comment #8 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
C0NPAQ

I can see some frustration/anxiety in your replies. Please step back for a
second and check with what Ilia is saying. Thank you.

With that said, here is my interpretation + some tips:

 * blue tint - irrc flash has an issue with blue tint with vdpau for which the
wrapper library added a workaround (enable_flash_uv_swap). Check if the
detection code [1] is not miss-behaving on your system/setup.

 * flashplayer crashes randomly regardless of the OS + driver combo on my
system :'(

 * You're missing the firmware required for vdpau to work properly with
nouveau. Install the nouveau-fw package from AUR or follow the instructions [2]
to do it manually.

 * Use only the recommended options when using mplayer + vdpau. If that does
not work provide a link to a sample which people can test against.

 * GL/VDAPU may be slow. As mentioned there is no reclocking at the moment,
making some things (tearing) even more annoying.

 * "I just tried wine and it did not run either" - now that is a bit too vague.
I would give some specific examples - running wine v.XXX, under distro YYY. I
get XXX output in console etc...

From the above you can see three different topics (vdpau, gl and performance),
and possibly even more bugs.

_Please_ keep them separate as things are easy to find/work on when you do not
have one massive blob that covers everything (divide and concur).

Don't take this the wrong way, but if you insist that these issues are due to a
single bug, then you are either delusional or far more knowledgeable in GL,
VDPAU and nouveau intrinsics than nearly everyone that has ever worked on
nouveau.


[1]
http://cgit.freedesktop.org/~aplattner/libvdpau/tree/src/vdpau_wrapper.c#n300
[2] http://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware
[3] http://nouveau.freedesktop.org/wiki/VideoAcceleration/#usingvdpau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401129300.0FdCd3fd2.2512
Date: Mon, 26 May 2014 18:35:00 +0000
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
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266">bug 79266</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>C0NPAQ

I can see some frustration/anxiety in your replies. Please step back for a
second and check with what Ilia is saying. Thank you.

With that said, here is my interpretation + some tips:

 * blue tint - irrc flash has an issue with blue tint with vdpau for which the
wrapper library added a workaround (enable_flash_uv_swap). Check if the
detection code [1] is not miss-behaving on your system/setup.

 * flashplayer crashes randomly regardless of the OS + driver combo on my
system :'(

 * You're missing the firmware required for vdpau to work properly with
nouveau. Install the nouveau-fw package from AUR or follow the instructions [2]
to do it manually.

 * Use only the recommended options when using mplayer + vdpau. If that does
not work provide a link to a sample which people can test against.

 * GL/VDAPU may be slow. As mentioned there is no reclocking at the moment,
making some things (tearing) even more annoying.

 * &quot;I just tried wine and it did not run either&quot; - now that is a bit too vague.
I would give some specific examples - running wine v.XXX, under distro YYY. I
get XXX output in console etc...

From the above you can see three different topics (vdpau, gl and performance),
and possibly even more bugs.

_Please_ keep them separate as things are easy to find/work on when you do not
have one massive blob that covers everything (divide and concur).

Don't take this the wrong way, but if you insist that these issues are due to a
single bug, then you are either delusional or far more knowledgeable in GL,
VDPAU and nouveau intrinsics than nearly everyone that has ever worked on
nouveau.


[1]
<a href="http://cgit.freedesktop.org/~aplattner/libvdpau/tree/src/vdpau_wrapper.c#n300">http://cgit.freedesktop.org/~aplattner/libvdpau/tree/src/vdpau_wrapper.c#n300</a>
[2] <a href="http://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware">http://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware</a>
[3] <a href="http://nouveau.freedesktop.org/wiki/VideoAcceleration/#usingvdpau">http://nouveau.freedesktop.org/wiki/VideoAcceleration/#usingvdpau</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401129300.0FdCd3fd2.2512--

--===============0419162797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0419162797==--
