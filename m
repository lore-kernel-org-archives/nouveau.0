From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88947] "Unknown" display appears with no external
 display connected
Date: Tue, 03 Feb 2015 21:18:32 +0000
Message-ID: <bug-88947-8800-dZkBVQIJnj@http.bugs.freedesktop.org/>
References: <bug-88947-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0618479827=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88947-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0618479827==
Content-Type: multipart/alternative; boundary="1422998312.E3a6ED62.7880"; charset="UTF-8"


--1422998312.E3a6ED62.7880
Date: Tue, 3 Feb 2015 21:18:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88947

--- Comment #1 from Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I'm guessing this is a muxed hybrid laptop?  We hit a similar issue in radeon. 
Basically the desktop environment doesn't understand muxed displays so it
reports the status of both GPUs.  Arguably vgaswitcheroo needs to be augmented
to properly report the mux information so userspace can do the right thing with
respect to muxed laptops, but a short term fix would be to just report
disconnected on whatever GPU is not currently selected via the mux.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422998312.E3a6ED62.7880
Date: Tue, 3 Feb 2015 21:18:32 +0000
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
   title="NEW - &quot;Unknown&quot; display appears with no external display connected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88947#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - &quot;Unknown&quot; display appears with no external display connected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88947">bug 88947</a>
              from <span class="vcard"><a class="email" href="mailto:alexdeucher&#64;gmail.com" title="Alex Deucher &lt;alexdeucher&#64;gmail.com&gt;"> <span class="fn">Alex Deucher</span></a>
</span></b>
        <pre>I'm guessing this is a muxed hybrid laptop?  We hit a similar issue in radeon. 
Basically the desktop environment doesn't understand muxed displays so it
reports the status of both GPUs.  Arguably vgaswitcheroo needs to be augmented
to properly report the mux information so userspace can do the right thing with
respect to muxed laptops, but a short term fix would be to just report
disconnected on whatever GPU is not currently selected via the mux.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422998312.E3a6ED62.7880--

--===============0618479827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0618479827==--
