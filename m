From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79266] [NVC1] GT 430 / GF108 sluggish,
 unstable performance and blue tint with vdpau
Date: Mon, 26 May 2014 19:36:07 +0000
Message-ID: <bug-79266-8800-87X0OkSFpb@http.bugs.freedesktop.org/>
References: <bug-79266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1376760953=="
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


--===============1376760953==
Content-Type: multipart/alternative; boundary="1401132967.b6f0EF471.14633"; charset="us-ascii"


--1401132967.b6f0EF471.14633
Date: Mon, 26 May 2014 19:36:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79266

--- Comment #10 from C0NPAQ <afasdfsdfaa-NltIWcMOmWn1P9xLtpHBDw@public.gmane.org> ---
I am sorry, but I am testing this on my main machine and it is driving me nuts. 

Now that I installed the nouveau-fw package, the flash colors are ok, but
everything is still extremely sluggish and, for lack of better words, just
weird. Also the PC crashed 2 times now since I tested in an hour or what, when
there was high disk load and I transversed from one screen to another ...


Why weird? For example this: the screen only updates if I move/wiggle the
mouse. If I create a new window, for example urxvt, I have to wiggle the mouse
around or it won't show ... literally. I can open alsamixer 'half way' from top
top to bottom if I stop moving the mouse. 

I have recorded some of the sluggishness with ffmpeg and that is when it got
even weirder: I recorded on :0.0 and the mouse would show from :0.0 but the
background was from :0.1 . Also, :0.0 is 1200x1028 and :0.1 is 1920x1080 (and
:0.2 is 1080x1920) and when I open firefox on :0.1 it only draws like 1200
pixell. 

Oh my god I am sorry, there is so much more, it is so hard to type because
seemingly arbitrarily the text/characters I type only shows 100ms to 2 seconds
later it makes me so agitated I have to stop and switch to nvidia again or I
will throw something out of the window the laggishness is just impossible.
Sorry. OPlease see the sxcreenshot I attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401132967.b6f0EF471.14633
Date: Mon, 26 May 2014 19:36:07 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266">bug 79266</a>
              from <span class="vcard"><a class="email" href="mailto:afasdfsdfaa&#64;master.ms" title="C0NPAQ &lt;afasdfsdfaa&#64;master.ms&gt;"> <span class="fn">C0NPAQ</span></a>
</span></b>
        <pre>I am sorry, but I am testing this on my main machine and it is driving me nuts. 

Now that I installed the nouveau-fw package, the flash colors are ok, but
everything is still extremely sluggish and, for lack of better words, just
weird. Also the PC crashed 2 times now since I tested in an hour or what, when
there was high disk load and I transversed from one screen to another ...


Why weird? For example this: the screen only updates if I move/wiggle the
mouse. If I create a new window, for example urxvt, I have to wiggle the mouse
around or it won't show ... literally. I can open alsamixer 'half way' from top
top to bottom if I stop moving the mouse. 

I have recorded some of the sluggishness with ffmpeg and that is when it got
even weirder: I recorded on :0.0 and the mouse would show from :0.0 but the
background was from :0.1 . Also, :0.0 is 1200x1028 and :0.1 is 1920x1080 (and
:0.2 is 1080x1920) and when I open firefox on :0.1 it only draws like 1200
pixell. 

Oh my god I am sorry, there is so much more, it is so hard to type because
seemingly arbitrarily the text/characters I type only shows 100ms to 2 seconds
later it makes me so agitated I have to stop and switch to nvidia again or I
will throw something out of the window the laggishness is just impossible.
Sorry. OPlease see the sxcreenshot I attached.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401132967.b6f0EF471.14633--

--===============1376760953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1376760953==--
