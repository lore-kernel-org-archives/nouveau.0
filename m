From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95044] [NVA0] [Reclocking] GPU doesn't relax memory
	clocks
Date: Sun, 08 May 2016 21:41:34 +0000
Message-ID: <bug-95044-8800-crNGuBHkt9@http.bugs.freedesktop.org/>
References: <bug-95044-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1472234899=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95044-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1472234899==
Content-Type: multipart/alternative; boundary="14627436942.8Bd1096.3334";
 charset="UTF-8"


--14627436942.8Bd1096.3334
Date: Sun, 8 May 2016 21:41:34 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95044

--- Comment #7 from Roy <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org> ---
Created attachment 123554
  --> https://bugs.freedesktop.org/attachment.cgi?id=123554&action=edit
Remove high-speed mode for GDDR3

Risking to make a fool out of myself because I haven't even compile-tested
this; please patch your kernel with the attached and see if it resolves your
problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14627436942.8Bd1096.3334
Date: Sun, 8 May 2016 21:41:34 +0000
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
   title="NEW - [NVA0] [Reclocking] GPU doesn't relax memory clocks"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95044#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA0] [Reclocking] GPU doesn't relax memory clocks"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95044">bug 95044</a>
              from <span class="vcard"><a class="email" href="mailto:rspliet&#64;eclipso.eu" title="Roy &lt;rspliet&#64;eclipso.eu&gt;"> <span class="fn">Roy</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=123554" name="attach_123554" title="Remove high-speed mode for GDDR3">attachment 123554</a> <a href="attachment.cgi?id=123554&amp;action=edit" title="Remove high-speed mode for GDDR3">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=95044&amp;attachment=123554'>[review]</a>
Remove high-speed mode for GDDR3

Risking to make a fool out of myself because I haven't even compile-tested
this; please patch your kernel with the attached and see if it resolves your
problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14627436942.8Bd1096.3334--

--===============1472234899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1472234899==--
