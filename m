From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Thu, 18 Jul 2013 23:45:19 +0000
Message-ID: <bug-67051-8800-0BsRDaFTRC@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1347167159=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1347167159==
Content-Type: multipart/alternative; boundary="1374191119.B7CFc061.18815"; charset="us-ascii"


--1374191119.B7CFc061.18815
Date: Thu, 18 Jul 2013 23:45:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #10)
> (In reply to comment #9)
> > (b) Can you test out a 3.7-based kernel?
> I suppose I can.  Let me know if it's critical for you to proceed with your
> work.  I'd rather wait for some more of your thoughts/tests/results _if
> possible_.  However, I'll jump to it immediately if you say the word.

Well, the situation is that I don't have any HDMI devices at all (either with
HDMI outputs or inputs, forget HDMI audio), nor do I know anything about it. So
if this doesn't work, that means that someone else needs to (a) reproduce your
issue [and note, hdmi audio does work for some other people, so there must be
something a bit more special about your situation, be it EDID data or more
missed register setup], and (b) do the RE work to figure out what we're
missing.

It seems like testing out an old kernel is easy by comparison. However I don't
hold out a huge amount of hope for it, since like you said, eld_valid = 0,
which more likely indicates an EDID issue.

If you're interested, some minor code inspection shows that at least some of
the logic is in nv50_display.c:nv50_audio_mode_set. You could add prints in
there to see what it's detecting stuff as. You could also add prints to
drm_edid.c:drm_detect_monitor_audio, perhaps your monitor's EDID is different
than what it expects.

Looks like there are a few prints already, you could see what happens when you
boot with drm.debug=0x06 which should output nouveau- and kms-related debug
statements.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374191119.B7CFc061.18815
Date: Thu, 18 Jul 2013 23:45:19 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67051#c10">comment #10</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=67051#c9">comment #9</a>)
&gt; &gt; (b) Can you test out a 3.7-based kernel?
&gt; I suppose I can.  Let me know if it's critical for you to proceed with your
&gt; work.  I'd rather wait for some more of your thoughts/tests/results _if
&gt; possible_.  However, I'll jump to it immediately if you say the word.</span >

Well, the situation is that I don't have any HDMI devices at all (either with
HDMI outputs or inputs, forget HDMI audio), nor do I know anything about it. So
if this doesn't work, that means that someone else needs to (a) reproduce your
issue [and note, hdmi audio does work for some other people, so there must be
something a bit more special about your situation, be it EDID data or more
missed register setup], and (b) do the RE work to figure out what we're
missing.

It seems like testing out an old kernel is easy by comparison. However I don't
hold out a huge amount of hope for it, since like you said, eld_valid = 0,
which more likely indicates an EDID issue.

If you're interested, some minor code inspection shows that at least some of
the logic is in nv50_display.c:nv50_audio_mode_set. You could add prints in
there to see what it's detecting stuff as. You could also add prints to
drm_edid.c:drm_detect_monitor_audio, perhaps your monitor's EDID is different
than what it expects.

Looks like there are a few prints already, you could see what happens when you
boot with drm.debug=0x06 which should output nouveau- and kms-related debug
statements.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374191119.B7CFc061.18815--

--===============1347167159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1347167159==--
