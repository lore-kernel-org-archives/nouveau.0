From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88868] PowerPC e5500, kernel crash, GT520, GT610
Date: Fri, 30 Jan 2015 09:04:40 +0000
Message-ID: <bug-88868-8800-2mMOU9Ej4l@http.bugs.freedesktop.org/>
References: <bug-88868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1874971206=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88868-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1874971206==
Content-Type: multipart/alternative; boundary="1422608680.4Eb3Cf1.18394"; charset="UTF-8"


--1422608680.4Eb3Cf1.18394
Date: Fri, 30 Jan 2015 09:04:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88868

--- Comment #12 from Dmitriy <oboturoff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 112968
  --> https://bugs.freedesktop.org/attachment.cgi?id=112968&action=edit
Gt610_log_patch

Thank you.

magic patch.
"boot" value is now correct.
What this command "ioread32_native(map);"  do ?
but kernel anyway crash on operation read 0x700000.

Value bar0 and value from addr.0x619f04 is not correct read. It is show in
debug in file bios/base.c

file base.c
        /* switch mmio to cpu's native endianness */
#ifndef __BIG_ENDIAN
        if (ioread32_native(map + 0x000004) != 0x00000000){
#else
        if (ioread32_native(map + 0x000004) == 0x00000000){
#endif
            iowrite32_native(0x01000001, map + 0x000004);
            ioread32_native(map);
        }

        /* read boot0 and strapping information */
        boot0 = ioread32_native(map + 0x000000);
        strap = ioread32_native(map + 0x101000);

        printk ("##boot0=%x\n",boot0);
        printk ("##strap=%x\n",strap);

file bios/base.c
    unsigned int tmp_val;

    if (device->card_type >= NV_50) {
        u64 addr = (u64)(nv_rd32(bios, 0x619f04) & 0xffffff00) << 8;
        if (!addr) {
            addr  = (u64)nv_rd32(bios, 0x001700) << 16;
            addr += 0xf0000;
        }

        bar0 = nv_mask(bios, 0x001700, 0xffffffff, addr >> 16);
        printk ("##%s(%d) bar0=%x\n",__FUNCTION__,__LINE__,bar0);
    }

    tmp_val = nv_rd32(bios, 0x619f04);
    printk ("##val=%x\n", tmp_val);

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422608680.4Eb3Cf1.18394
Date: Fri, 30 Jan 2015 09:04:40 +0000
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
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868">bug 88868</a>
              from <span class="vcard"><a class="email" href="mailto:oboturoff&#64;gmail.com" title="Dmitriy &lt;oboturoff&#64;gmail.com&gt;"> <span class="fn">Dmitriy</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=112968" name="attach_112968" title="Gt610_log_patch">attachment 112968</a> <a href="attachment.cgi?id=112968&amp;action=edit" title="Gt610_log_patch">[details]</a></span>
Gt610_log_patch

Thank you.

magic patch.
&quot;boot&quot; value is now correct.
What this command &quot;ioread32_native(map);&quot;  do ?
but kernel anyway crash on operation read 0x700000.

Value bar0 and value from addr.0x619f04 is not correct read. It is show in
debug in file bios/base.c

file base.c
        /* switch mmio to cpu's native endianness */
#ifndef __BIG_ENDIAN
        if (ioread32_native(map + 0x000004) != 0x00000000){
#else
        if (ioread32_native(map + 0x000004) == 0x00000000){
#endif
            iowrite32_native(0x01000001, map + 0x000004);
            ioread32_native(map);
        }

        /* read boot0 and strapping information */
        boot0 = ioread32_native(map + 0x000000);
        strap = ioread32_native(map + 0x101000);

        printk (&quot;##boot0=%x\n&quot;,boot0);
        printk (&quot;##strap=%x\n&quot;,strap);

file bios/base.c
    unsigned int tmp_val;

    if (device-&gt;card_type &gt;= NV_50) {
        u64 addr = (u64)(nv_rd32(bios, 0x619f04) &amp; 0xffffff00) &lt;&lt; 8;
        if (!addr) {
            addr  = (u64)nv_rd32(bios, 0x001700) &lt;&lt; 16;
            addr += 0xf0000;
        }

        bar0 = nv_mask(bios, 0x001700, 0xffffffff, addr &gt;&gt; 16);
        printk (&quot;##%s(%d) bar0=%x\n&quot;,__FUNCTION__,__LINE__,bar0);
    }

    tmp_val = nv_rd32(bios, 0x619f04);
    printk (&quot;##val=%x\n&quot;, tmp_val);</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422608680.4Eb3Cf1.18394--

--===============1874971206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1874971206==--
