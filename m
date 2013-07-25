From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Thu, 25 Jul 2013 17:10:40 +0000
Message-ID: <bug-67051-8800-yKh1ZzrTCk@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0434042282=="
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


--===============0434042282==
Content-Type: multipart/alternative; boundary="1374772240.321EbAF70.31595"; charset="us-ascii"


--1374772240.321EbAF70.31595
Date: Thu, 25 Jul 2013 17:10:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #86 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
STATUS UPDATE as of 07/25/2013 1 PM EDT

SUMMARY
After extensive tests, discussions, changes, etc.,
still at square ONE (i.e., at subject of this Bug Report - NO HDMI sound).

DETAILS (latest tests)

The mmio nouveau traces of the
 8e9e3d2deacc460fbb8a4691140318f6e85e6891 ("BAD" commit)
and
 f7960736d0b8647fd149687d15deb79e47122d69 ("GOOD" commit)
were presented to the Bug analyst (Ilia Mirkin) two days ago.

Patches proposed by Ilia (based on trace analysis):
 hdmi-1.patch + hdminva3.patch + hdminva3-4.patch + debug-3.patch

1.  On "standard" 3.10.1 (i.e., as opposed to "git"):

 hdmi-1.patch FAILS
 The remaining three OK.
 Build OK
 Boot-up OK
 X OK
 Good edl#3.0, NO HDMI sound.

2.  On "git" master (circa, 3.11.0-rc1+)
 All four patches OK
 Build OK
 Boot-up (to level 3) OK
 X (level 5) a mess.  Frozen system.

3.  On "git" 8e9e3d2deacc460fbb8a4691140318f6e85e6891 (the "BAD" commit)
 Last patch (debug-3) fails.
 Agreed not to proceed with the build ('debug-3' was the latest hope of a fix)

COMMENTS

4.  "Standard" 3.7.10 and "git" f7960736d0b8647fd149687d15deb79e47122d69
   eld#3.0  Good       Good (normal, as expected) HDMI sound

This shows that at one point ( < 3.8.0 ) things were normal (HDMI-sound wise).
This eliminates the typical Linux lame excuse that the video card might not be
"standard".  The manufacturer, EVGA, is one of the most reputable NVidia OEM
vendors.  As a reminder, no HDMI-sound problems on NVIDIA proprietary driver,
nor on Win 7.

CONCLUSION

Somewhere after 3.7.10 (to the untrained eye) and/or after
f7960736d0b8647fd149687d15deb79e47122d69 (to the expert eye) somebody
(probably in an typical attempt to "improve" the product, the nouveau driver)
messed up (i.e., among other things, eliminated the HDMI sound).

-- Alex

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374772240.321EbAF70.31595
Date: Thu, 25 Jul 2013 17:10:40 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c86">Comment # 86</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>STATUS UPDATE as of 07/25/2013 1 PM EDT

SUMMARY
After extensive tests, discussions, changes, etc.,
still at square ONE (i.e., at subject of this Bug Report - NO HDMI sound).

DETAILS (latest tests)

The mmio nouveau traces of the
 8e9e3d2deacc460fbb8a4691140318f6e85e6891 (&quot;BAD&quot; commit)
and
 f7960736d0b8647fd149687d15deb79e47122d69 (&quot;GOOD&quot; commit)
were presented to the Bug analyst (Ilia Mirkin) two days ago.

Patches proposed by Ilia (based on trace analysis):
 hdmi-1.patch + hdminva3.patch + hdminva3-4.patch + debug-3.patch

1.  On &quot;standard&quot; 3.10.1 (i.e., as opposed to &quot;git&quot;):

 hdmi-1.patch FAILS
 The remaining three OK.
 Build OK
 Boot-up OK
 X OK
 Good edl#3.0, NO HDMI sound.

2.  On &quot;git&quot; master (circa, 3.11.0-rc1+)
 All four patches OK
 Build OK
 Boot-up (to level 3) OK
 X (level 5) a mess.  Frozen system.

3.  On &quot;git&quot; 8e9e3d2deacc460fbb8a4691140318f6e85e6891 (the &quot;BAD&quot; commit)
 Last patch (debug-3) fails.
 Agreed not to proceed with the build ('debug-3' was the latest hope of a fix)

COMMENTS

4.  &quot;Standard&quot; 3.7.10 and &quot;git&quot; f7960736d0b8647fd149687d15deb79e47122d69
   eld#3.0  Good       Good (normal, as expected) HDMI sound

This shows that at one point ( &lt; 3.8.0 ) things were normal (HDMI-sound wise).
This eliminates the typical Linux lame excuse that the video card might not be
&quot;standard&quot;.  The manufacturer, EVGA, is one of the most reputable NVidia OEM
vendors.  As a reminder, no HDMI-sound problems on NVIDIA proprietary driver,
nor on Win 7.

CONCLUSION

Somewhere after 3.7.10 (to the untrained eye) and/or after
f7960736d0b8647fd149687d15deb79e47122d69 (to the expert eye) somebody
(probably in an typical attempt to &quot;improve&quot; the product, the nouveau driver)
messed up (i.e., among other things, eliminated the HDMI sound).

-- Alex</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374772240.321EbAF70.31595--

--===============0434042282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0434042282==--
