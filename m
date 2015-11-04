From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91236] [NVC3] Passive DP to HDMI adapter cannot use
 pixel clocks greater than 165 MHz
Date: Wed, 04 Nov 2015 03:45:56 +0000
Message-ID: <bug-91236-8800-AvpXu7opnE@http.bugs.freedesktop.org/>
References: <bug-91236-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0212053823=="
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


--===============0212053823==
Content-Type: multipart/alternative; boundary="1446608756.F4d5B471.16252"; charset="UTF-8"


--1446608756.F4d5B471.16252
Date: Wed, 4 Nov 2015 03:45:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91236

--- Comment #6 from Andrew Boettcher <a.boettcher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I am reporting the patches worked great! Indeed I am now viewing this bug with
a screen in 297 MHz over a passive DP to HDMI connector. Before we missed the
second part where the dual link mode was activated.

This is great, thanks! I guess the next step is to figure out how to detect the
real limit, which I believe is 300 MHz on this chip.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446608756.F4d5B471.16252
Date: Wed, 4 Nov 2015 03:45:56 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91236#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC3] Passive DP to HDMI adapter cannot use pixel clocks greater than 165 MHz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91236">bug 91236</a>
              from <span class="vcard"><a class="email" href="mailto:a.boettcher&#64;gmail.com" title="Andrew Boettcher &lt;a.boettcher&#64;gmail.com&gt;"> <span class="fn">Andrew Boettcher</span></a>
</span></b>
        <pre>I am reporting the patches worked great! Indeed I am now viewing this bug with
a screen in 297 MHz over a passive DP to HDMI connector. Before we missed the
second part where the dual link mode was activated.

This is great, thanks! I guess the next step is to figure out how to detect the
real limit, which I believe is 300 MHz on this chip.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446608756.F4d5B471.16252--

--===============0212053823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0212053823==--
