From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81485] [NVE4] dmesg spam on startup
Date: Fri, 22 Aug 2014 05:17:57 +0000
Message-ID: <bug-81485-8800-0FMgA8ShBt@http.bugs.freedesktop.org/>
References: <bug-81485-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0838000679=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81485-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0838000679==
Content-Type: multipart/alternative; boundary="1408684677.2BcDC832.27206"; charset="us-ascii"


--1408684677.2BcDC832.27206
Date: Fri, 22 Aug 2014 05:17:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81485

--- Comment #17 from Konstantin Svist <fry.kun-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Aug 21 22:16:16 mireille kernel: nouveau: module verification failed: signature
and/or  required key missing - tainting kernel
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_mmap (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_global_release
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_clean_mm (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_pool_unpopulate
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_agp_tt_create (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_manager_func
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_global_init
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_move_ttm (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_dma_tt_fini (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_device_release
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_agp_tt_populate
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_kunmap (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol
ttm_bo_del_sub_from_lru (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_agp_tt_unpopulate
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_mem_put (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_mem_space (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_device_init
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_wait (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_init_mm (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_dma_acc_size
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_tt_bind (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_evict_mm (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_kmap (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_add_to_lru (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_unref (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_mem_global_release
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_mem_global_init
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_dma_populate (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_dma_unpopulate
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_init (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_validate (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol
ttm_bo_move_accel_cleanup (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_move_memcpy
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_dma_tt_init (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_pool_populate (err
0)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408684677.2BcDC832.27206
Date: Fri, 22 Aug 2014 05:17:57 +0000
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
   title="NEW --- - [NVE4] dmesg spam on startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81485#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] dmesg spam on startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81485">bug 81485</a>
              from <span class="vcard"><a class="email" href="mailto:fry.kun&#64;gmail.com" title="Konstantin Svist &lt;fry.kun&#64;gmail.com&gt;"> <span class="fn">Konstantin Svist</span></a>
</span></b>
        <pre>Aug 21 22:16:16 mireille kernel: nouveau: module verification failed: signature
and/or  required key missing - tainting kernel
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_mmap (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_global_release
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_clean_mm (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_pool_unpopulate
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_agp_tt_create (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_manager_func
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_global_init
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_move_ttm (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_dma_tt_fini (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_device_release
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_agp_tt_populate
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_kunmap (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol
ttm_bo_del_sub_from_lru (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_agp_tt_unpopulate
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_mem_put (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_mem_space (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_device_init
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_wait (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_init_mm (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_dma_acc_size
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_tt_bind (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_evict_mm (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_kmap (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_add_to_lru (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_unref (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_mem_global_release
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_mem_global_init
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_dma_populate (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_dma_unpopulate
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_init (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_validate (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol
ttm_bo_move_accel_cleanup (err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_bo_move_memcpy
(err 0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_dma_tt_init (err
0)
Aug 21 22:16:16 mireille kernel: nouveau: Unknown symbol ttm_pool_populate (err
0)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408684677.2BcDC832.27206--

--===============0838000679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0838000679==--
