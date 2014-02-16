From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70213] [git-v3.12-rc3 + nouveau HEAD] Vmalloc
 failure -> pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x50 returns -12
Date: Sun, 16 Feb 2014 17:17:07 +0000
Message-ID: <bug-70213-8800-4fr2cxRAGU@http.bugs.freedesktop.org/>
References: <bug-70213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1735524198=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70213-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1735524198==
Content-Type: multipart/alternative; boundary="1392571026.CCc2f1.7738"; charset="us-ascii"


--1392571026.CCc2f1.7738
Date: Sun, 16 Feb 2014 17:17:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70213

--- Comment #6 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I tried this:

nv84_fence_suspend(struct nouveau_drm *drm)
{
    struct nouveau_fifo *pfifo = nouveau_fifo(drm->device);
    struct nv84_fence_priv *priv = drm->fence;
    int i;

    priv->suspend = vmalloc((pfifo->max + 1) * sizeof(u32));
    if (priv->suspend) {
        for (i = 0; i <= pfifo->max; i++)
            priv->suspend[i] = nouveau_bo_rd32(priv->bo, i*4);
    }

    /*return priv->suspend != NULL;*/
    return false;
}

This did not work, the laptop suspended (which is actually good news since it
started working for this hardware).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392571026.CCc2f1.7738
Date: Sun, 16 Feb 2014 17:17:06 +0000
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
   title="NEW --- - [git-v3.12-rc3 + nouveau HEAD] Vmalloc failure -&gt; pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x50 returns -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70213#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [git-v3.12-rc3 + nouveau HEAD] Vmalloc failure -&gt; pci_pm_freeze(): nouveau_pmops_freeze+0x0/0x50 returns -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70213">bug 70213</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>I tried this:

nv84_fence_suspend(struct nouveau_drm *drm)
{
    struct nouveau_fifo *pfifo = nouveau_fifo(drm-&gt;device);
    struct nv84_fence_priv *priv = drm-&gt;fence;
    int i;

    priv-&gt;suspend = vmalloc((pfifo-&gt;max + 1) * sizeof(u32));
    if (priv-&gt;suspend) {
        for (i = 0; i &lt;= pfifo-&gt;max; i++)
            priv-&gt;suspend[i] = nouveau_bo_rd32(priv-&gt;bo, i*4);
    }

    /*return priv-&gt;suspend != NULL;*/
    return false;
}

This did not work, the laptop suspended (which is actually good news since it
started working for this hardware).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392571026.CCc2f1.7738--

--===============1735524198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1735524198==--
