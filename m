From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91954] "link training failed": nouveau does not
 recover from monitor suspend
Date: Thu, 10 Sep 2015 05:35:24 +0000
Message-ID: <bug-91954-8800-FsToekqzbm@http.bugs.freedesktop.org/>
References: <bug-91954-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0161201054=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91954-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0161201054==
Content-Type: multipart/alternative; boundary="1441863324.70Fe8151.9824"; charset="UTF-8"


--1441863324.70Fe8151.9824
Date: Thu, 10 Sep 2015 05:35:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91954

--- Comment #2 from Dan Callaghan <djc-vNUPr3c+39GHXe+LvDLADg@public.gmane.org> ---
The Nvidia proprietary driver is able to recover from the monitor going to
sleep.

Here is an mmiotrace showing the monitor going to sleep (xset dpms force
suspend), eventually powering down, and then waking up and nvidia recovering
the display:

https://fedorapeople.org/~dcallagh/fdo-bz91954-mmiotrace.log.xz

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1441863324.70Fe8151.9824
Date: Thu, 10 Sep 2015 05:35:24 +0000
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
   title="NEW - &quot;link training failed&quot;: nouveau does not recover from monitor suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91954#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - &quot;link training failed&quot;: nouveau does not recover from monitor suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91954">bug 91954</a>
              from <span class="vcard"><a class="email" href="mailto:djc&#64;djc.id.au" title="Dan Callaghan &lt;djc&#64;djc.id.au&gt;"> <span class="fn">Dan Callaghan</span></a>
</span></b>
        <pre>The Nvidia proprietary driver is able to recover from the monitor going to
sleep.

Here is an mmiotrace showing the monitor going to sleep (xset dpms force
suspend), eventually powering down, and then waking up and nvidia recovering
the display:

<a href="https://fedorapeople.org/~dcallagh/fdo-bz91954-mmiotrace.log.xz">https://fedorapeople.org/~dcallagh/fdo-bz91954-mmiotrace.log.xz</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441863324.70Fe8151.9824--

--===============0161201054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0161201054==--
