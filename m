From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] nouveau: NV4E acceleration corruption when
 DMA above 31-bit (2 Gig barrier)
Date: Wed, 03 Oct 2012 11:14:04 +0000
Message-ID: <bug-46557-8800-dAl6atkmHo@http.bugs.freedesktop.org/>
References: <bug-46557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1943992878=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-46557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1943992878==
Content-Type: multipart/alternative; boundary="1349262844.ecA2C33.7272"; charset="us-ascii"


--1349262844.ecA2C33.7272
Date: Wed, 3 Oct 2012 11:14:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=46557

--- Comment #22 from baldur-htSm2yLGOjU@public.gmane.org ---
For my system (reported Bug 54988) it starts up now and works for a RAM size of
3G.

But after logging into the gnome desktop the screen becomes blurry and 
and while trying to open any gnome menu, the screen gets scrambled now.
This is even a problem when i boot with mem=2G - this used to work with the
current version of the fedora driver in kernel 3.5.4.

Seems the DMA problem is gone, however some new bugs are showing up :-)

System Description is still the same as 54988. I am running a current fedora
kernel,patched with nouveau from 2nd October.


Linux version 3.5.4-2.localnouveau.fc17.x86_64 (root@baldur) (gcc version 4.7.2
20120921 (Red Hat 4.7.2-2) (GCC) ) #1 SMP Wed Oct 3 11:36:49 CEST 2012

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1349262844.ecA2C33.7272
Date: Wed, 3 Oct 2012 11:14:04 +0000
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
   title="NEW --- - nouveau: NV4E acceleration corruption when DMA above 31-bit (2 Gig barrier)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=46557#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau: NV4E acceleration corruption when DMA above 31-bit (2 Gig barrier)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=46557">bug 46557</a>
              from <span class="vcard"><a class="email" href="mailto:baldur&#64;email.de" title="baldur&#64;email.de">baldur&#64;email.de</a>
</span></b>
        <pre>For my system (reported <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [C51PV] Garbage on initial Console Screen"
   href="show_bug.cgi?id=54988">Bug 54988</a>) it starts up now and works for a RAM size of
3G.

But after logging into the gnome desktop the screen becomes blurry and 
and while trying to open any gnome menu, the screen gets scrambled now.
This is even a problem when i boot with mem=2G - this used to work with the
current version of the fedora driver in kernel 3.5.4.

Seems the DMA problem is gone, however some new bugs are showing up :-)

System Description is still the same as 54988. I am running a current fedora
kernel,patched with nouveau from 2nd October.


Linux version 3.5.4-2.localnouveau.fc17.x86_64 (root&#64;baldur) (gcc version 4.7.2
20120921 (Red Hat 4.7.2-2) (GCC) ) #1 SMP Wed Oct 3 11:36:49 CEST 2012</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1349262844.ecA2C33.7272--

--===============1943992878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1943992878==--
