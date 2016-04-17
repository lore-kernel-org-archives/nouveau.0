From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93458] page allocation failure: order:5,
	mode:0x240c0c0
Date: Sun, 17 Apr 2016 07:23:08 +0000
Message-ID: <bug-93458-8800-vdQl7eicDu@http.bugs.freedesktop.org/>
References: <bug-93458-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0296374031=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93458-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0296374031==
Content-Type: multipart/alternative; boundary="14608777871.Ce8dB8A8.28855";
 charset="UTF-8"


--14608777871.Ce8dB8A8.28855
Date: Sun, 17 Apr 2016 07:23:07 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93458

--- Comment #6 from Matt Whitlock <freedesktop-wf/ZkUcLzLDBWRuVRseHprNAH6kLmebB@public.gmane.org> ---
(In reply to Matt Whitlock from comment #5)
> I would venture a guess that the memory allocated for a GPU FIFO buffer
> needs to be physically continuous, as it will be used for DMA

I take it back. Looking into the source code, the allocation is happening in
nvkm_ramht_new(…), which is allocating a struct nvkm_ramht containing a
variably-sized array of struct nvkm_ramht_data elements. As these elements, in
turn, contain pointers, it seems very unlikely that they'd be DMA'd, so
presumably the struct nvkm_ramht doesn't need to be physically contiguous and
could safely be allocated by vzalloc(…).

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14608777871.Ce8dB8A8.28855
Date: Sun, 17 Apr 2016 07:23:07 +0000
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
   title="NEW - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458">bug 93458</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;mattwhitlock.name" title="Matt Whitlock &lt;freedesktop&#64;mattwhitlock.name&gt;"> <span class="fn">Matt Whitlock</span></a>
</span></b>
        <pre>(In reply to Matt Whitlock from <a href="show_bug.cgi?id=93458#c5">comment #5</a>)
<span class="quote">&gt; I would venture a guess that the memory allocated for a GPU FIFO buffer
&gt; needs to be physically continuous, as it will be used for DMA</span >

I take it back. Looking into the source code, the allocation is happening in
nvkm_ramht_new(…), which is allocating a struct nvkm_ramht containing a
variably-sized array of struct nvkm_ramht_data elements. As these elements, in
turn, contain pointers, it seems very unlikely that they'd be DMA'd, so
presumably the struct nvkm_ramht doesn't need to be physically contiguous and
could safely be allocated by vzalloc(…).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14608777871.Ce8dB8A8.28855--

--===============0296374031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0296374031==--
