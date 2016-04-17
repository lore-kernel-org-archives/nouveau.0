From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91523] [NVE7] driver cannot initialize gpu(failed to
 parse ramcfg data)
Date: Sun, 17 Apr 2016 17:45:43 +0000
Message-ID: <bug-91523-8800-OcZSpynNXm@http.bugs.freedesktop.org/>
References: <bug-91523-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1602949872=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91523-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1602949872==
Content-Type: multipart/alternative; boundary="14609151431.DAdd963e0.31435";
 charset="UTF-8"


--14609151431.DAdd963e0.31435
Date: Sun, 17 Apr 2016 17:45:43 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=91523

--- Comment #3 from Ilia Bozhinov <iliyabo-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> ---
It seems that the code that triggers this bug is in
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.cpp around line 1583. It seems
that the assumption in the comment is not true, on my card this condition
obviously doesn't mean that the card should be ignored completely. This maybe
has some other meaning, does anybody know how I can help debugging the problem?
I'm posting the comment in the code:

/* parse bios data for all rammap table entries up-front, and                   
 * build information on whether certain fields differ between                   
 * any of the entries.                                                          
 *                                                                              
 * the binary driver appears to completely ignore some fields                   
 * when all entries contain the same value.  at first, it was                   
 * hoped that these were mere optimisations and the bios init                   
 * tables had configured as per the values here, but there is                   
 * evidence now to suggest that this isn't the case and we do                   
 * need to treat this condition as a "don't touch" indicator.                   
 */

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14609151431.DAdd963e0.31435
Date: Sun, 17 Apr 2016 17:45:43 +0000
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
   title="NEW - [NVE7] driver cannot initialize gpu(failed to parse ramcfg data)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91523#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] driver cannot initialize gpu(failed to parse ramcfg data)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91523">bug 91523</a>
              from <span class="vcard"><a class="email" href="mailto:iliyabo&#64;hotmail.com" title="Ilia Bozhinov &lt;iliyabo&#64;hotmail.com&gt;"> <span class="fn">Ilia Bozhinov</span></a>
</span></b>
        <pre>It seems that the code that triggers this bug is in
drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.cpp around line 1583. It seems
that the assumption in the comment is not true, on my card this condition
obviously doesn't mean that the card should be ignored completely. This maybe
has some other meaning, does anybody know how I can help debugging the problem?
I'm posting the comment in the code:

/* parse bios data for all rammap table entries up-front, and                   
 * build information on whether certain fields differ between                   
 * any of the entries.                                                          
 *                                                                              
 * the binary driver appears to completely ignore some fields                   
 * when all entries contain the same value.  at first, it was                   
 * hoped that these were mere optimisations and the bios init                   
 * tables had configured as per the values here, but there is                   
 * evidence now to suggest that this isn't the case and we do                   
 * need to treat this condition as a &quot;don't touch&quot; indicator.                   
 */</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14609151431.DAdd963e0.31435--

--===============1602949872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1602949872==--
