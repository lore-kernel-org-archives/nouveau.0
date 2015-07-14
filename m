From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91333] Connecting second of two monitors to a Lenovo
 W520 causes displays to go crazy
Date: Tue, 14 Jul 2015 04:02:26 +0000
Message-ID: <bug-91333-8800-mcz0RREMdo@http.bugs.freedesktop.org/>
References: <bug-91333-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0283562900=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91333-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0283562900==
Content-Type: multipart/alternative; boundary="1436846546.357Fd7F1.21940"; charset="UTF-8"


--1436846546.357Fd7F1.21940
Date: Tue, 14 Jul 2015 04:02:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91333

--- Comment #5 from Corey Ashford <cjashfor-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #4)
> I bet it works if you first disable one of the screens before plugging a
> third one in.

I had tried that experiment before, but I just now tried it again.  Same bad
result.  Here are the steps I took.

1) Boot laptop with no external monitors connected.
2) Attach Displayport-connected monitor.  All is well.
3) Disable internal monitor.  All is still well... now using only the external
monitor.
4) Plug in VGA monitor.
5) Nothing happens.
6) I bring up the Gnome Displays setting (not clicking anything yet), then the
system starts with its display resetting (or whatever it's doing), and becomes
unresponsive to keyboard input.
7) The only way to get back to a usable system is to disconnect the VGA
display, which after 5-10 seconds gets me back to the Gnome login, and after
logging in I was able to capture the dmesg output (will attach).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436846546.357Fd7F1.21940
Date: Tue, 14 Jul 2015 04:02:26 +0000
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
   title="NEW - Connecting second of two monitors to a Lenovo W520 causes displays to go crazy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91333#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Connecting second of two monitors to a Lenovo W520 causes displays to go crazy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91333">bug 91333</a>
              from <span class="vcard"><a class="email" href="mailto:cjashfor&#64;us.ibm.com" title="Corey Ashford &lt;cjashfor&#64;us.ibm.com&gt;"> <span class="fn">Corey Ashford</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=91333#c4">comment #4</a>)
<span class="quote">&gt; I bet it works if you first disable one of the screens before plugging a
&gt; third one in.</span >

I had tried that experiment before, but I just now tried it again.  Same bad
result.  Here are the steps I took.

1) Boot laptop with no external monitors connected.
2) Attach Displayport-connected monitor.  All is well.
3) Disable internal monitor.  All is still well... now using only the external
monitor.
4) Plug in VGA monitor.
5) Nothing happens.
6) I bring up the Gnome Displays setting (not clicking anything yet), then the
system starts with its display resetting (or whatever it's doing), and becomes
unresponsive to keyboard input.
7) The only way to get back to a usable system is to disconnect the VGA
display, which after 5-10 seconds gets me back to the Gnome login, and after
logging in I was able to capture the dmesg output (will attach).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436846546.357Fd7F1.21940--

--===============0283562900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0283562900==--
