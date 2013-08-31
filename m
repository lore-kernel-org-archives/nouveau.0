From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39550] [NV96] Brightness stuck to low value after
 suspend/resume on HP Elitebook 8530w
Date: Sat, 31 Aug 2013 16:13:36 +0000
Message-ID: <bug-39550-8800-IjjSHnKFLr@http.bugs.freedesktop.org/>
References: <bug-39550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1731633515=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1731633515==
Content-Type: multipart/alternative; boundary="1377965616.EbFb5fF7.5253"; charset="us-ascii"


--1377965616.EbFb5fF7.5253
Date: Sat, 31 Aug 2013 16:13:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=39550

--- Comment #43 from rick <rick.hendricksen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #41)
> What backlight driver is being used? Please post your dmesg. Are you booting
> with acpi_backlight=vendor ?

No, I am booting with the following command line:
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-linux
root=UUID=d30907c8-9c00-4b4f-9dfb-b01990328a7a rw loglevel=3

Also, is there an IRC channel or something I could join to speed up
communication regarding this bug?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377965616.EbFb5fF7.5253
Date: Sat, 31 Aug 2013 16:13:36 +0000
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
   title="NEW --- - [NV96] Brightness stuck to low value after suspend/resume on HP Elitebook 8530w"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550#c43">Comment # 43</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] Brightness stuck to low value after suspend/resume on HP Elitebook 8530w"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550">bug 39550</a>
              from <span class="vcard"><a class="email" href="mailto:rick.hendricksen&#64;gmail.com" title="rick &lt;rick.hendricksen&#64;gmail.com&gt;"> <span class="fn">rick</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=39550#c41">comment #41</a>)
<span class="quote">&gt; What backlight driver is being used? Please post your dmesg. Are you booting
&gt; with acpi_backlight=vendor ?</span >

No, I am booting with the following command line:
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-linux
root=UUID=d30907c8-9c00-4b4f-9dfb-b01990328a7a rw loglevel=3

Also, is there an IRC channel or something I could join to speed up
communication regarding this bug?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377965616.EbFb5fF7.5253--

--===============1731633515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1731633515==--
