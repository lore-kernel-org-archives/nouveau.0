From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70208] Nouveau driver doesn't find vbios for Geforce
 GT 750M on Asus N750JV laptop
Date: Tue, 08 Oct 2013 07:49:33 +0000
Message-ID: <bug-70208-8800-P9dUMBpj2D@http.bugs.freedesktop.org/>
References: <bug-70208-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2128583527=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70208-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2128583527==
Content-Type: multipart/alternative; boundary="1381218572.2AAE1.22476"; charset="us-ascii"


--1381218572.2AAE1.22476
Date: Tue, 8 Oct 2013 07:49:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70208

--- Comment #21 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Ouch, yes. Seems like the function pci_get_dev_by_id() in undefined outside of
drivers/pci

In that case I see two solution - iterate through each device type (vga/3d) or
making the symbol accessible at a larger scale.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381218572.2AAE1.22476
Date: Tue, 8 Oct 2013 07:49:32 +0000
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
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208">bug 70208</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Ouch, yes. Seems like the function pci_get_dev_by_id() in undefined outside of
drivers/pci

In that case I see two solution - iterate through each device type (vga/3d) or
making the symbol accessible at a larger scale.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381218572.2AAE1.22476--

--===============2128583527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2128583527==--
