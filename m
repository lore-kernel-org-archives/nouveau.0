From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94643] 4K Display on Displayport goes black when
 pointer hits column 0
Date: Mon, 04 Apr 2016 14:39:42 +0000
Message-ID: <bug-94643-8800-Iol7yiT09h@http.bugs.freedesktop.org/>
References: <bug-94643-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0394692701=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94643-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0394692701==
Content-Type: multipart/alternative; boundary="14597807821.53fdA4AbC.2163";
 charset="UTF-8"


--14597807821.53fdA4AbC.2163
Date: Mon, 4 Apr 2016 14:39:42 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94643

--- Comment #5 from Robert Schöftner <rmu-hikZAF2L1OleoWH0uzbU5w@public.gmane.org> ---
I already had a quick look for "obvious" off-by-one-errors in
linux/drivers/gpu/drm/nouveau, following nv50_crtc_cursor_move, the but of
course I didn't find any.

Usually the GPU does not go completely bonkers, the LVDS-connected display of
the laptop continues to display a screen and usually remains completely
useable.

I also tried enabling "SWcursor", but that leads to completely black screen and
unuseable X, even with only internal display, which I probably should report as
a separate bug.

If somebody has an idea where to look, I'm quite capable of compiling and
testing patched nouveau kernel and userspace drivers.

Would something like mmiotrace be helpful or a waste of time?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14597807821.53fdA4AbC.2163
Date: Mon, 4 Apr 2016 14:39:42 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - 4K Display on Displayport goes black when pointer hits column 0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94643#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - 4K Display on Displayport goes black when pointer hits column 0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94643">bug 94643</a>
              from <span class="vcard"><a class="email" href="mailto:rmu&#64;unfoo.net" title="Robert Schöftner &lt;rmu&#64;unfoo.net&gt;"> <span class="fn">Robert Schöftner</span></a>
</span></b>
        <pre>I already had a quick look for &quot;obvious&quot; off-by-one-errors in
linux/drivers/gpu/drm/nouveau, following nv50_crtc_cursor_move, the but of
course I didn't find any.

Usually the GPU does not go completely bonkers, the LVDS-connected display of
the laptop continues to display a screen and usually remains completely
useable.

I also tried enabling &quot;SWcursor&quot;, but that leads to completely black screen and
unuseable X, even with only internal display, which I probably should report as
a separate bug.

If somebody has an idea where to look, I'm quite capable of compiling and
testing patched nouveau kernel and userspace drivers.

Would something like mmiotrace be helpful or a waste of time?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14597807821.53fdA4AbC.2163--

--===============0394692701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0394692701==--
