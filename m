From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94374] transparent window with DRI_PRIME=1,
 depending on size of used textures
Date: Wed, 02 Mar 2016 19:45:17 +0000
Message-ID: <bug-94374-8800-hF9bVyiHBP@http.bugs.freedesktop.org/>
References: <bug-94374-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1561216275=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94374-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1561216275==
Content-Type: multipart/alternative; boundary="14569479170.2D4BA.13282";
 charset="UTF-8"


--14569479170.2D4BA.13282
Date: Wed, 2 Mar 2016 19:45:17 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94374

--- Comment #2 from Karol Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> ---
It doesn't seem to be transparted (check the window border of the window in the
background. The new window simply contains the the background as the buffer and
moving around won't update the content ;)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14569479170.2D4BA.13282
Date: Wed, 2 Mar 2016 19:45:17 +0000
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
   title="NEW - transparent window with DRI_PRIME=1, depending on size of used textures"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94374#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - transparent window with DRI_PRIME=1, depending on size of used textures"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94374">bug 94374</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;karolherbst.de" title="Karol Herbst &lt;freedesktop&#64;karolherbst.de&gt;"> <span class="fn">Karol Herbst</span></a>
</span></b>
        <pre>It doesn't seem to be transparted (check the window border of the window in the
background. The new window simply contains the the background as the buffer and
moving around won't update the content ;)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14569479170.2D4BA.13282--

--===============1561216275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1561216275==--
