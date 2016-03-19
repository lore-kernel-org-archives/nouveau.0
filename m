From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94627] Game Risen on wine black grass
Date: Sat, 19 Mar 2016 20:54:04 +0000
Message-ID: <bug-94627-8800-10qgCTzgOE@http.bugs.freedesktop.org/>
References: <bug-94627-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2127012470=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94627-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2127012470==
Content-Type: multipart/alternative; boundary="14584208440.dae45B2.24739";
 charset="UTF-8"


--14584208440.dae45B2.24739
Date: Sat, 19 Mar 2016 20:54:04 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94627

--- Comment #4 from Karol Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> ---
I bisected it, here is my git bisect log:

git bisect start
# bad: [5dbb57a99482e2e04302ec8ef8cb4130e4ddb882] nouveua_compiler stuff
git bisect bad 5dbb57a99482e2e04302ec8ef8cb4130e4ddb882
# good: [9f21fdd8e697a1a0868f4ec4573235325294b7b3] Update version to 11.2.0-rc3
git bisect good 9f21fdd8e697a1a0868f4ec4573235325294b7b3
# good: [4cd5e5b48e24a8b8ff7255022208d3e5fe6557d8] nouveau: update the
Makefile.sources list
git bisect good 4cd5e5b48e24a8b8ff7255022208d3e5fe6557d8
# good: [b4b50b074beae9b679e5acdbb4b49193e539576d] mesa: Make glGet queries
initialize ctx->Debug when necessary.
git bisect good b4b50b074beae9b679e5acdbb4b49193e539576d
# good: [60c08aa90bce4c8766a747c8517f7ff6987937f0] gallium/radeon: disable
CMASK on handle export if sharing doesn't allow it (v2)
git bisect good 60c08aa90bce4c8766a747c8517f7ff6987937f0
# good: [8be9efcce70f671afcaf3cfc76c624b3467b7834] radeon/uvd: handle HEVC main
10 decode
git bisect good 8be9efcce70f671afcaf3cfc76c624b3467b7834
# bad: [c1e4a6bfbf015801c6a8b0ae694482421a22c2d9] nv50,nvc0: handle SQRT
lowering inside the driver
git bisect bad c1e4a6bfbf015801c6a8b0ae694482421a22c2d9
# good: [a651bc027d5ed4150bb5240fc9f46a6ca569f665] nvc0: fix blit triangle size
to fully cover FB's > 8192x8192
git bisect good a651bc027d5ed4150bb5240fc9f46a6ca569f665
# good: [b3e7fb52349848b24f005c07859bc43691bd64bd] nv50/ir: avoid folding mul +
add if the mul has a dnz
git bisect good b3e7fb52349848b24f005c07859bc43691bd64bd
# first bad commit: [c1e4a6bfbf015801c6a8b0ae694482421a22c2d9] nv50,nvc0:
handle SQRT lowering inside the driver

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14584208440.dae45B2.24739
Date: Sat, 19 Mar 2016 20:54:04 +0000
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
   title="NEW - Game Risen on wine black grass"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94627#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Game Risen on wine black grass"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94627">bug 94627</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;karolherbst.de" title="Karol Herbst &lt;freedesktop&#64;karolherbst.de&gt;"> <span class="fn">Karol Herbst</span></a>
</span></b>
        <pre>I bisected it, here is my git bisect log:

git bisect start
# bad: [5dbb57a99482e2e04302ec8ef8cb4130e4ddb882] nouveua_compiler stuff
git bisect bad 5dbb57a99482e2e04302ec8ef8cb4130e4ddb882
# good: [9f21fdd8e697a1a0868f4ec4573235325294b7b3] Update version to 11.2.0-rc3
git bisect good 9f21fdd8e697a1a0868f4ec4573235325294b7b3
# good: [4cd5e5b48e24a8b8ff7255022208d3e5fe6557d8] nouveau: update the
Makefile.sources list
git bisect good 4cd5e5b48e24a8b8ff7255022208d3e5fe6557d8
# good: [b4b50b074beae9b679e5acdbb4b49193e539576d] mesa: Make glGet queries
initialize ctx-&gt;Debug when necessary.
git bisect good b4b50b074beae9b679e5acdbb4b49193e539576d
# good: [60c08aa90bce4c8766a747c8517f7ff6987937f0] gallium/radeon: disable
CMASK on handle export if sharing doesn't allow it (v2)
git bisect good 60c08aa90bce4c8766a747c8517f7ff6987937f0
# good: [8be9efcce70f671afcaf3cfc76c624b3467b7834] radeon/uvd: handle HEVC main
10 decode
git bisect good 8be9efcce70f671afcaf3cfc76c624b3467b7834
# bad: [c1e4a6bfbf015801c6a8b0ae694482421a22c2d9] nv50,nvc0: handle SQRT
lowering inside the driver
git bisect bad c1e4a6bfbf015801c6a8b0ae694482421a22c2d9
# good: [a651bc027d5ed4150bb5240fc9f46a6ca569f665] nvc0: fix blit triangle size
to fully cover FB's &gt; 8192x8192
git bisect good a651bc027d5ed4150bb5240fc9f46a6ca569f665
# good: [b3e7fb52349848b24f005c07859bc43691bd64bd] nv50/ir: avoid folding mul +
add if the mul has a dnz
git bisect good b3e7fb52349848b24f005c07859bc43691bd64bd
# first bad commit: [c1e4a6bfbf015801c6a8b0ae694482421a22c2d9] nv50,nvc0:
handle SQRT lowering inside the driver</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14584208440.dae45B2.24739--

--===============2127012470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2127012470==--
