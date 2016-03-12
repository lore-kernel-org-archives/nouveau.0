From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94374] transparent window with DRI_PRIME=1,
 depending on size of used textures
Date: Sat, 12 Mar 2016 18:44:52 +0000
Message-ID: <bug-94374-8800-eHnkIpwJGG@http.bugs.freedesktop.org/>
References: <bug-94374-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0079195779=="
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


--===============0079195779==
Content-Type: multipart/alternative; boundary="14578082910.3b8D2feCB.14783";
 charset="UTF-8"


--14578082910.3b8D2feCB.14783
Date: Sat, 12 Mar 2016 18:44:51 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94374

--- Comment #7 from Wolfgang Wallner <wolfgang-wallner-RbZlAiThDcE@public.gmane.org> ---
I can reproduce the same error, but with Intel and AMD hardware.

This is what happens when I run DRI_PRIME=1 steam, and I found this bug report
when I searched for the symptoms. As I said, in my case it is not related to
nouveau, as I use a laptop with an Intel/AMD combination.

My system:

The hardware is a HP Pavillion with mux-less hybrid graphics: Intel Sandy
Bridge and AMD Radeon HD 6770

Kubuntu 15.10 with KDE backports
Mesa 11.0.2

My symptoms:

DRI_PRIME=1 glxgears    --> works
DRI_PRIME=1 ./a.out 64  --> works
DRI_PRIME=1 ./a.out 512 --> transparent window
DRI_PRIME=1 steam       --> transparent window

If I can provide any additional information, please let me know (I have now
idea about debugging graphical bugs, so I don't really know what to provide).

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14578082910.3b8D2feCB.14783
Date: Sat, 12 Mar 2016 18:44:51 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94374#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - transparent window with DRI_PRIME=1, depending on size of used textures"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94374">bug 94374</a>
              from <span class="vcard"><a class="email" href="mailto:wolfgang-wallner&#64;gmx.at" title="Wolfgang Wallner &lt;wolfgang-wallner&#64;gmx.at&gt;"> <span class="fn">Wolfgang Wallner</span></a>
</span></b>
        <pre>I can reproduce the same error, but with Intel and AMD hardware.

This is what happens when I run DRI_PRIME=1 steam, and I found this bug report
when I searched for the symptoms. As I said, in my case it is not related to
nouveau, as I use a laptop with an Intel/AMD combination.

My system:

The hardware is a HP Pavillion with mux-less hybrid graphics: Intel Sandy
Bridge and AMD Radeon HD 6770

Kubuntu 15.10 with KDE backports
Mesa 11.0.2

My symptoms:

DRI_PRIME=1 glxgears    --&gt; works
DRI_PRIME=1 ./a.out 64  --&gt; works
DRI_PRIME=1 ./a.out 512 --&gt; transparent window
DRI_PRIME=1 steam       --&gt; transparent window

If I can provide any additional information, please let me know (I have now
idea about debugging graphical bugs, so I don't really know what to provide).</pre>
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
--14578082910.3b8D2feCB.14783--

--===============0079195779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0079195779==--
