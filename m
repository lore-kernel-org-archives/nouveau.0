From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87554] [NV1A] 3.19-rc1 NULL dereference on modprobe
 in pramin_fini
Date: Sun, 21 Dec 2014 15:21:20 +0000
Message-ID: <bug-87554-8800-KfXXtA4ypV@http.bugs.freedesktop.org/>
References: <bug-87554-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1724031693=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87554-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1724031693==
Content-Type: multipart/alternative; boundary="1419175280.DD2f62af1.8846"; charset="UTF-8"


--1419175280.DD2f62af1.8846
Date: Sun, 21 Dec 2014 15:21:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87554

--- Comment #1 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
Matching objdump -d -S nouveau.ko:

000136c0 <pramin_fini>:

static void
pramin_fini(void *data)
{
   136c0:       55                      push   %ebp
   136c1:       89 e5                   mov    %esp,%ebp
   136c3:       53                      push   %ebx
   136c4:       89 c3                   mov    %eax,%ebx
static inline void
nv_wr32(void *obj, u32 addr, u32 data)
{
        struct nouveau_subdev *subdev = nv_subdev(obj);
        nv_spam(subdev, "nv_wr32 0x%06x 0x%08x\n", addr, data);
        iowrite32_native(data, subdev->mmio + addr);
   136c6:       8b 00                   mov    (%eax),%eax
   136c8:       8b 50 24                mov    0x24(%eax),%edx
   136cb:       8b 43 04                mov    0x4(%ebx),%eax
   136ce:       81 c2 00 17 00 00       add    $0x1700,%edx
   136d4:       e8 fc ff ff ff          call   136d5 <pramin_fini+0x15>
        struct priv *priv = data;
        nv_wr32(priv->bios, 0x001700, priv->bar0);
        kfree(priv);
   136d9:       89 d8                   mov    %ebx,%eax
   136db:       e8 fc ff ff ff          call   136dc <pramin_fini+0x1c>
}
   136e0:       5b                      pop    %ebx
   136e1:       5d                      pop    %ebp
   136e2:       c3                      ret    
   136e3:       8d b6 00 00 00 00       lea    0x0(%esi),%esi
   136e9:       8d bc 27 00 00 00 00    lea    0x0(%edi,%eiz,1),%edi


Source code:
static void
pramin_fini(void *data)
{
        struct priv *priv = data;
        nv_wr32(priv->bios, 0x001700, priv->bar0);
        kfree(priv);
}

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419175280.DD2f62af1.8846
Date: Sun, 21 Dec 2014 15:21:20 +0000
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
   title="NEW - [NV1A] 3.19-rc1 NULL dereference on modprobe in pramin_fini"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87554#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV1A] 3.19-rc1 NULL dereference on modprobe in pramin_fini"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87554">bug 87554</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>Matching objdump -d -S nouveau.ko:

000136c0 &lt;pramin_fini&gt;:

static void
pramin_fini(void *data)
{
   136c0:       55                      push   %ebp
   136c1:       89 e5                   mov    %esp,%ebp
   136c3:       53                      push   %ebx
   136c4:       89 c3                   mov    %eax,%ebx
static inline void
nv_wr32(void *obj, u32 addr, u32 data)
{
        struct nouveau_subdev *subdev = nv_subdev(obj);
        nv_spam(subdev, &quot;nv_wr32 0x%06x 0x%08x\n&quot;, addr, data);
        iowrite32_native(data, subdev-&gt;mmio + addr);
   136c6:       8b 00                   mov    (%eax),%eax
   136c8:       8b 50 24                mov    0x24(%eax),%edx
   136cb:       8b 43 04                mov    0x4(%ebx),%eax
   136ce:       81 c2 00 17 00 00       add    $0x1700,%edx
   136d4:       e8 fc ff ff ff          call   136d5 &lt;pramin_fini+0x15&gt;
        struct priv *priv = data;
        nv_wr32(priv-&gt;bios, 0x001700, priv-&gt;bar0);
        kfree(priv);
   136d9:       89 d8                   mov    %ebx,%eax
   136db:       e8 fc ff ff ff          call   136dc &lt;pramin_fini+0x1c&gt;
}
   136e0:       5b                      pop    %ebx
   136e1:       5d                      pop    %ebp
   136e2:       c3                      ret    
   136e3:       8d b6 00 00 00 00       lea    0x0(%esi),%esi
   136e9:       8d bc 27 00 00 00 00    lea    0x0(%edi,%eiz,1),%edi


Source code:
static void
pramin_fini(void *data)
{
        struct priv *priv = data;
        nv_wr32(priv-&gt;bios, 0x001700, priv-&gt;bar0);
        kfree(priv);
}</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419175280.DD2f62af1.8846--

--===============1724031693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1724031693==--
