From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39550] Brightness stuck to low value after
	suspend/resume
Date: Mon, 15 Oct 2012 07:08:36 +0000
Message-ID: <bug-39550-8800-Fk8yaNp1EB@http.bugs.freedesktop.org/>
References: <bug-39550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0263970216=="
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


--===============0263970216==
Content-Type: multipart/alternative; boundary="1350284916.bA2bDADC6.17164"; charset="us-ascii"


--1350284916.bA2bDADC6.17164
Date: Mon, 15 Oct 2012 07:08:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=39550

--- Comment #35 from ChriS <chris00-cBm5OqgzVeIUrb4e85K3Fw@public.gmane.org> ---
Still present in kernel 3.6.2, even with acpi_backlight=vendor
nouveau.force_post=1 and "Support for backlight control" disabled in the kernel
configuration.

The funny thing is that the display seem to come back at the right brightness
initially and then is changed to max brightness a second after.

Like many people, this bug unfortunately prevents me to switch to the free
driver.  It would be really nice if it was fixed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1350284916.bA2bDADC6.17164
Date: Mon, 15 Oct 2012 07:08:36 +0000
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
   title="NEW --- - Brightness stuck to low value after suspend/resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Brightness stuck to low value after suspend/resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39550">bug 39550</a>
              from <span class="vcard"><a class="email" href="mailto:chris00&#64;aliceadsl.fr" title="ChriS &lt;chris00&#64;aliceadsl.fr&gt;"> <span class="fn">ChriS</span></a>
</span></b>
        <pre>Still present in kernel 3.6.2, even with acpi_backlight=vendor
nouveau.force_post=1 and &quot;Support for backlight control&quot; disabled in the kernel
configuration.

The funny thing is that the display seem to come back at the right brightness
initially and then is changed to max brightness a second after.

Like many people, this bug unfortunately prevents me to switch to the free
driver.  It would be really nice if it was fixed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1350284916.bA2bDADC6.17164--

--===============0263970216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0263970216==--
