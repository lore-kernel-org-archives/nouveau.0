From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70208] Nouveau driver doesn't find vbios for Geforce
 GT 750M on Asus N750JV laptop
Date: Sun, 06 Oct 2013 23:11:18 +0000
Message-ID: <bug-70208-8800-8AUMHSmDvx@http.bugs.freedesktop.org/>
References: <bug-70208-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1699862068=="
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


--===============1699862068==
Content-Type: multipart/alternative; boundary="1381101079.ce7e31.16814"; charset="us-ascii"


--1381101079.ce7e31.16814
Date: Sun, 6 Oct 2013 23:11:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70208

--- Comment #12 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 87218
  --> https://bugs.freedesktop.org/attachment.cgi?id=87218&action=edit
cleaner approach to patch 87214

Another patch that does the same thing, without iterating though all the pci
devices twice :) Currently only VGA and 3D devices are selected via the mask,
although it may be easily changed in the future :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381101079.ce7e31.16814
Date: Sun, 6 Oct 2013 23:11:19 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208">bug 70208</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=87218" name="attach_87218" title="cleaner approach to patch 87214">attachment 87218</a> <a href="attachment.cgi?id=87218&amp;action=edit" title="cleaner approach to patch 87214">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=70208&amp;attachment=87218'>[review]</a>
cleaner approach to patch 87214

Another patch that does the same thing, without iterating though all the pci
devices twice :) Currently only VGA and 3D devices are selected via the mask,
although it may be easily changed in the future :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381101079.ce7e31.16814--

--===============1699862068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1699862068==--
