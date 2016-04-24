From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95095] NV46 (G72) Full screen artifacts in Freespace
 2 SW OT mod
Date: Sun, 24 Apr 2016 18:58:23 +0000
Message-ID: <bug-95095-8800-0kvqN2LM26@http.bugs.freedesktop.org/>
References: <bug-95095-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0117797807=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95095-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0117797807==
Content-Type: multipart/alternative; boundary="14615243030.F8a04C.26598";
 charset="UTF-8"


--14615243030.F8a04C.26598
Date: Sun, 24 Apr 2016 18:58:23 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95095

--- Comment #4 from Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

The attachment was related to a freeze-lockup, even if it's most probably a
different problem.

> If you are involved with the development of this application, could you
> verify that it never uses a 32-bit color buffer with a 16-bit depth buffer,
> or a 16-bit color buffer with a 24-bit depth buffer? (That's RGBA8 + Z16 or
> RGB565 + Z24.) Those combinations, while perfectly legal in GL, are not
> actually supported by the hardware, and the driver "works around it" by just
> disabling depth, which results in broken rendering (but at least no
> hangs...).

I'm not involved in fs2_open project, I'm contributing to Star Wars mod testing
on Linux,

but I found something interesting, using the NV30_SWTNL=1 parameter, I could
cycle all models and get trace to qapitrate retrace all the sequence with hwtnl
and ...

...  just some specific 3D models produce z-culling artifacts, where parts of
the 3D model, like the X-Wind hull, are put extremely "in the front" hiding
everything, while other 3D models are perfectly rendered.

I'm going to check with 3D model owners if there is a way to correct the
impacted 3D models.

Thanks a lot Ilia!

I'll report back when I found the exact cause of the problem.

> Lastly, please ensure you're using a semi-recent mesa...

I'm testing with mesa git (oibaf ppa)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14615243030.F8a04C.26598
Date: Sun, 24 Apr 2016 18:58:23 +0000
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
   title="NEW - NV46 (G72) Full screen artifacts in Freespace 2 SW OT mod"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95095#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV46 (G72) Full screen artifacts in Freespace 2 SW OT mod"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95095">bug 95095</a>
              from <span class="vcard"><a class="email" href="mailto:issor.oruam&#64;gmail.com" title="Mauro Rossi &lt;issor.oruam&#64;gmail.com&gt;"> <span class="fn">Mauro Rossi</span></a>
</span></b>
        <pre>
The attachment was related to a freeze-lockup, even if it's most probably a
different problem.

<span class="quote">&gt; If you are involved with the development of this application, could you
&gt; verify that it never uses a 32-bit color buffer with a 16-bit depth buffer,
&gt; or a 16-bit color buffer with a 24-bit depth buffer? (That's RGBA8 + Z16 or
&gt; RGB565 + Z24.) Those combinations, while perfectly legal in GL, are not
&gt; actually supported by the hardware, and the driver &quot;works around it&quot; by just
&gt; disabling depth, which results in broken rendering (but at least no
&gt; hangs...).</span >

I'm not involved in fs2_open project, I'm contributing to Star Wars mod testing
on Linux,

but I found something interesting, using the NV30_SWTNL=1 parameter, I could
cycle all models and get trace to qapitrate retrace all the sequence with hwtnl
and ...

...  just some specific 3D models produce z-culling artifacts, where parts of
the 3D model, like the X-Wind hull, are put extremely &quot;in the front&quot; hiding
everything, while other 3D models are perfectly rendered.

I'm going to check with 3D model owners if there is a way to correct the
impacted 3D models.

Thanks a lot Ilia!

I'll report back when I found the exact cause of the problem.

<span class="quote">&gt; Lastly, please ensure you're using a semi-recent mesa...</span >

I'm testing with mesa git (oibaf ppa)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14615243030.F8a04C.26598--

--===============0117797807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0117797807==--
