From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94817] Nearest neighbor scaling?
Date: Tue, 05 Apr 2016 13:35:07 +0000
Message-ID: <bug-94817-8800-146VJn1rcg@http.bugs.freedesktop.org/>
References: <bug-94817-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0298934381=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94817-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0298934381==
Content-Type: multipart/alternative; boundary="14598633061.DFfDC32f8.4173";
 charset="UTF-8"


--14598633061.DFfDC32f8.4173
Date: Tue, 5 Apr 2016 13:35:06 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94817

--- Comment #2 from nw9165-3201-/E1597aS9LQAvxtiuMwx3w@public.gmane.org ---
Hi,

actually I have submitted the same feature request for the Intel and AMD
drivers and also for the NVIDIA proprietary one as well yesterday. It has
resulted in a patch for xrandr that allows to use nearest neighbor scaling now,
see:

https://bugs.freedesktop.org/show_bug.cgi?id=94816
https://bugs.freedesktop.org/show_bug.cgi?id=94820
https://bugs.freedesktop.org/show_bug.cgi?id=94819

Anyway, as already being discussed in those three threads, it would be
interesting to know if the dedicated hardware scaler inside the GPU could also
be used for this instead of using xrandr.

Can anyone comment on this?

Regards

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14598633061.DFfDC32f8.4173
Date: Tue, 5 Apr 2016 13:35:06 +0000
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
   title="NEW - Nearest neighbor scaling?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94817#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nearest neighbor scaling?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94817">bug 94817</a>
              from <span class="vcard"><a class="email" href="mailto:nw9165-3201&#64;yahoo.com" title="nw9165-3201&#64;yahoo.com">nw9165-3201&#64;yahoo.com</a>
</span></b>
        <pre>Hi,

actually I have submitted the same feature request for the Intel and AMD
drivers and also for the NVIDIA proprietary one as well yesterday. It has
resulted in a patch for xrandr that allows to use nearest neighbor scaling now,
see:

<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nearest neighbor scaling?"
   href="show_bug.cgi?id=94816">https://bugs.freedesktop.org/show_bug.cgi?id=94816</a>
<a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - Nearest neighbor scaling?"
   href="show_bug.cgi?id=94820">https://bugs.freedesktop.org/show_bug.cgi?id=94820</a>
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nearest neighbor scaling?"
   href="show_bug.cgi?id=94819">https://bugs.freedesktop.org/show_bug.cgi?id=94819</a>

Anyway, as already being discussed in those three threads, it would be
interesting to know if the dedicated hardware scaler inside the GPU could also
be used for this instead of using xrandr.

Can anyone comment on this?

Regards</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14598633061.DFfDC32f8.4173--

--===============0298934381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0298934381==--
