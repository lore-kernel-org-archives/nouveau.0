From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88893] [NV46] GPU lockup with Quadro NVS 110M
Date: Tue, 03 Feb 2015 02:47:53 +0000
Message-ID: <bug-88893-8800-HvoAui9rl0@http.bugs.freedesktop.org/>
References: <bug-88893-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1270091811=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88893-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1270091811==
Content-Type: multipart/alternative; boundary="1422931672.B3CCBa0d1.10114"; charset="UTF-8"


--1422931672.B3CCBa0d1.10114
Date: Tue, 3 Feb 2015 02:47:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88893

--- Comment #13 from Richard <hobbes1069-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Ok, a bit more info!

It turns out that X wasn't completely hanging but it was taking a REALLY long
time to get to gnome-shell, long enough that it actually sleeps the monitor and
then I get the lock screen when I wake it up. 

Current versions:
nouveau: current git (as of a few days ago)
libdrm: 2.4.59

kernel options: nouveau.noaccel=1

I can attach the journal log but nothing is jumping out except maybe:
kernel: perf interrupt took too long (10103 > 9615), lowering
kernel.perf_event_max_sample_rate to 13000

But I'm not sure that's related.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422931672.B3CCBa0d1.10114
Date: Tue, 3 Feb 2015 02:47:52 +0000
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
   title="NEW - [NV46] GPU lockup with Quadro NVS 110M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88893#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] GPU lockup with Quadro NVS 110M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88893">bug 88893</a>
              from <span class="vcard"><a class="email" href="mailto:hobbes1069&#64;gmail.com" title="Richard &lt;hobbes1069&#64;gmail.com&gt;"> <span class="fn">Richard</span></a>
</span></b>
        <pre>Ok, a bit more info!

It turns out that X wasn't completely hanging but it was taking a REALLY long
time to get to gnome-shell, long enough that it actually sleeps the monitor and
then I get the lock screen when I wake it up. 

Current versions:
nouveau: current git (as of a few days ago)
libdrm: 2.4.59

kernel options: nouveau.noaccel=1

I can attach the journal log but nothing is jumping out except maybe:
kernel: perf interrupt took too long (10103 &gt; 9615), lowering
kernel.perf_event_max_sample_rate to 13000

But I'm not sure that's related.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422931672.B3CCBa0d1.10114--

--===============1270091811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1270091811==--
