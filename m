From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to poweron GPU on GM204
 after dynamic poweroff
Date: Wed, 06 Apr 2016 04:52:14 +0000
Message-ID: <bug-94725-8800-VHWiRizfmC@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1106577341=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1106577341==
Content-Type: multipart/alternative; boundary="14599183341.5e40D.21731";
 charset="UTF-8"


--14599183341.5e40D.21731
Date: Wed, 6 Apr 2016 04:52:14 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94725

--- Comment #17 from Rashed Abdel-Tawab <rashed-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org> ---
Created attachment 122747
  --> https://bugs.freedesktop.org/attachment.cgi?id=122747&action=edit
new dmesg during hang

I decided to keep testing this in case we missed something, and running lshw
twice in a row causes it to hang. I'm not sure what's up with it so I've
attached the dmesg. It looks pretty similar to before, but that doesn't make
sense since Alexandre patched the original problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14599183341.5e40D.21731
Date: Wed, 6 Apr 2016 04:52:14 +0000
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
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to poweron GPU on GM204 after dynamic poweroff"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725">bug 94725</a>
              from <span class="vcard"><a class="email" href="mailto:rashed&#64;linux.com" title="Rashed Abdel-Tawab &lt;rashed&#64;linux.com&gt;"> <span class="fn">Rashed Abdel-Tawab</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=122747" name="attach_122747" title="new dmesg during hang">attachment 122747</a> <a href="attachment.cgi?id=122747&amp;action=edit" title="new dmesg during hang">[details]</a></span>
new dmesg during hang

I decided to keep testing this in case we missed something, and running lshw
twice in a row causes it to hang. I'm not sure what's up with it so I've
attached the dmesg. It looks pretty similar to before, but that doesn't make
sense since Alexandre patched the original problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14599183341.5e40D.21731--

--===============1106577341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1106577341==--
