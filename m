From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98609] Firefox right click corrupted with DRI3
Date: Sun, 06 Nov 2016 17:36:48 +0000
Message-ID: <bug-98609-8800-MeZTABsclS@http.bugs.freedesktop.org/>
References: <bug-98609-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1317177366=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98609-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1317177366==
Content-Type: multipart/alternative; boundary="14784538080.eFea5DcF.15049";
 charset="UTF-8"


--14784538080.eFea5DcF.15049
Date: Sun, 6 Nov 2016 17:36:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98609

--- Comment #7 from Paviluf <jeremy9856-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Forgot to mention that I opened an other issue on Firefox bug tracker and t=
hat
I use this user.js in Firefox

https://bugzilla.mozilla.org/show_bug.cgi?id=3D1315529

// PERFORMANCE
user_pref("layers.acceleration.force-enabled", true);
user_pref("layers.offmainthreadcomposition.enabled", true);
user_pref("layers.offmainthreadcomposition.async-animations", true);
user_pref("layout.frame_rate.precise", true);
user_pref("webgl.force-enabled", true);
user_pref("webgl.msaa-force", true);
user_pref("html5.offmainthread", true);
user_pref("gfx.content.azure.backends", "skia");
user_pref("browser.tabs.remote.force-enable", true);

// PRIVACY
user_pref("loop.enabled", false);
user_pref("extensions.pocket.enabled", false);
user_pref("privacy.trackingprotection.enabled", true);
user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("dom.event.clipboardevents.enabled", false);
user_pref("browser.send_pings", false);
user_pref("dom.battery.enabled", false);

// USABILITY
user_pref("browser.tabs.loadBookmarksInBackground", true);
user_pref("reader.parse-on-load.enabled", false);
user_pref("reader.parse-on-load.force-enabled", false);

It seem that without the user.js file the right click works. But that user.=
js
is not an option since without it there is tearing.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14784538080.eFea5DcF.15049
Date: Sun, 6 Nov 2016 17:36:48 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Firefox right click corrupted with DRI3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98609#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Firefox right click corrupted with DRI3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98609">bug 98609<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeremy9856&#64;gmail.com" title=3D"Paviluf &lt;jeremy9856&#64;gmail.com&gt;=
"> <span class=3D"fn">Paviluf</span></a>
</span></b>
        <pre>Forgot to mention that I opened an other issue on Firefox bug =
tracker and that
I use this user.js in Firefox

<a href=3D"https://bugzilla.mozilla.org/show_bug.cgi?id=3D1315529">https://=
bugzilla.mozilla.org/show_bug.cgi?id=3D1315529</a>

// PERFORMANCE
user_pref(&quot;layers.acceleration.force-enabled&quot;, true);
user_pref(&quot;layers.offmainthreadcomposition.enabled&quot;, true);
user_pref(&quot;layers.offmainthreadcomposition.async-animations&quot;, tru=
e);
user_pref(&quot;layout.frame_rate.precise&quot;, true);
user_pref(&quot;webgl.force-enabled&quot;, true);
user_pref(&quot;webgl.msaa-force&quot;, true);
user_pref(&quot;html5.offmainthread&quot;, true);
user_pref(&quot;gfx.content.azure.backends&quot;, &quot;skia&quot;);
user_pref(&quot;browser.tabs.remote.force-enable&quot;, true);

// PRIVACY
user_pref(&quot;loop.enabled&quot;, false);
user_pref(&quot;extensions.pocket.enabled&quot;, false);
user_pref(&quot;privacy.trackingprotection.enabled&quot;, true);
user_pref(&quot;browser.safebrowsing.enabled&quot;, false);
user_pref(&quot;browser.safebrowsing.malware.enabled&quot;, false);
user_pref(&quot;dom.event.clipboardevents.enabled&quot;, false);
user_pref(&quot;browser.send_pings&quot;, false);
user_pref(&quot;dom.battery.enabled&quot;, false);

// USABILITY
user_pref(&quot;browser.tabs.loadBookmarksInBackground&quot;, true);
user_pref(&quot;reader.parse-on-load.enabled&quot;, false);
user_pref(&quot;reader.parse-on-load.force-enabled&quot;, false);

It seem that without the user.js file the right click works. But that user.=
js
is not an option since without it there is tearing.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14784538080.eFea5DcF.15049--

--===============1317177366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1317177366==--
