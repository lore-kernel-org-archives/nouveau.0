From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94832] Reverse Prime corruption with nouveau using
 radeon outputs
Date: Tue, 05 Apr 2016 20:38:30 +0000
Message-ID: <bug-94832-8800-e8IVfIHZEN@http.bugs.freedesktop.org/>
References: <bug-94832-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1060220532=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94832-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1060220532==
Content-Type: multipart/alternative; boundary="14598887101.e7ACDdA5.15670";
 charset="UTF-8"


--14598887101.e7ACDdA5.15670
Date: Tue, 5 Apr 2016 20:38:30 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94832

--- Comment #5 from Christoph Haag <haagch-7lD2lakjNIixeQ3y2VaiTg@public.gmane.org> ---
Created attachment 122736
  --> https://bugs.freedesktop.org/attachment.cgi?id=122736&action=edit
dmesg

Somehow I forgot to check dmesg.

I guess the
[   39.172099] nouveau 0000:00:0d.0: bus: MMIO write of 007c0001 FAULT at
00b010
indicate a problem...

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14598887101.e7ACDdA5.15670
Date: Tue, 5 Apr 2016 20:38:30 +0000
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
   title="NEW - Reverse Prime corruption with nouveau using radeon outputs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94832#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Reverse Prime corruption with nouveau using radeon outputs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94832">bug 94832</a>
              from <span class="vcard"><a class="email" href="mailto:haagch&#64;frickel.club" title="Christoph Haag &lt;haagch&#64;frickel.club&gt;"> <span class="fn">Christoph Haag</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=122736" name="attach_122736" title="dmesg">attachment 122736</a> <a href="attachment.cgi?id=122736&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

Somehow I forgot to check dmesg.

I guess the
[   39.172099] nouveau 0000:00:0d.0: bus: MMIO write of 007c0001 FAULT at
00b010
indicate a problem...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14598887101.e7ACDdA5.15670--

--===============1060220532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1060220532==--
