From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Tue, 02 Feb 2016 23:16:08 +0000
Message-ID: <bug-70354-8800-FeFpCILLVR@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0504434732=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0504434732==
Content-Type: multipart/alternative; boundary="14544549680.9656Fb9f.28641";
 charset="UTF-8"


--14544549680.9656Fb9f.28641
Date: Tue, 2 Feb 2016 23:16:08 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #94 from bruno.pagani-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org ---
So, after 4.4 landed on Arch, finally got this working.

Though, like previous poster, I have some messages in dmesg:

[  336.351782] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[  336.410877] nouveau 0000:02:00.0: DRM: Pointer to TMDS table invalid
[  336.410880] nouveau 0000:02:00.0: DRM: Pointer to flat panel table invalid

Should I open a new bug for those?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14544549680.9656Fb9f.28641
Date: Tue, 2 Feb 2016 23:16:08 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c94">Comment # 94</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:bruno.pagani&#64;ens-lyon.org" title="bruno.pagani&#64;ens-lyon.org">bruno.pagani&#64;ens-lyon.org</a>
</span></b>
        <pre>So, after 4.4 landed on Arch, finally got this working.

Though, like previous poster, I have some messages in dmesg:

[  336.351782] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]
[  336.410877] nouveau 0000:02:00.0: DRM: Pointer to TMDS table invalid
[  336.410880] nouveau 0000:02:00.0: DRM: Pointer to flat panel table invalid

Should I open a new bug for those?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14544549680.9656Fb9f.28641--

--===============0504434732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0504434732==--
