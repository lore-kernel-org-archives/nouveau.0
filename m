From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91236] [NVC3] Passive DP to HDMI adapter cannot use
 pixel clocks greater than 165 MHz
Date: Wed, 04 Nov 2015 02:11:32 +0000
Message-ID: <bug-91236-8800-6UBDNvIuTH@http.bugs.freedesktop.org/>
References: <bug-91236-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1363499427=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91236-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1363499427==
Content-Type: multipart/alternative; boundary="1446603092.46AEe2.21759"; charset="UTF-8"


--1446603092.46AEe2.21759
Date: Wed, 4 Nov 2015 02:11:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91236

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
With the below pair of patches, you should be able to set any max pixel clock
you like.

http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=8d5fe3328855063bb41acb00b1049138acce8e2e
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=f787ef9b44102ed01d4255a653d0261bb6365ba3

These should apply relatively easily onto a 4.3 or even older kernel. Boot with
nouveau.hdmimhz=297.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446603092.46AEe2.21759
Date: Wed, 4 Nov 2015 02:11:32 +0000
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
   title="NEW - [NVC3] Passive DP to HDMI adapter cannot use pixel clocks greater than 165 MHz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91236#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC3] Passive DP to HDMI adapter cannot use pixel clocks greater than 165 MHz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91236">bug 91236</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>With the below pair of patches, you should be able to set any max pixel clock
you like.

<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=8d5fe3328855063bb41acb00b1049138acce8e2e">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=8d5fe3328855063bb41acb00b1049138acce8e2e</a>
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=f787ef9b44102ed01d4255a653d0261bb6365ba3">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=f787ef9b44102ed01d4255a653d0261bb6365ba3</a>

These should apply relatively easily onto a 4.3 or even older kernel. Boot with
nouveau.hdmimhz=297.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446603092.46AEe2.21759--

--===============1363499427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1363499427==--
