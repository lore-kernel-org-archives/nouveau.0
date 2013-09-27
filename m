From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69488] GF108 (NVC1) GPU lockup
Date: Fri, 27 Sep 2013 15:28:19 +0000
Message-ID: <bug-69488-8800-oJ3ZClbpB0@http.bugs.freedesktop.org/>
References: <bug-69488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1654714143=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1654714143==
Content-Type: multipart/alternative; boundary="1380295699.05142.27392"; charset="us-ascii"


--1380295699.05142.27392
Date: Fri, 27 Sep 2013 15:28:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69488

--- Comment #6 from Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org> ---
Created attachment 86729
  --> https://bugs.freedesktop.org/attachment.cgi?id=86729&action=edit
better patch for sysfb_simplefb that adjusts the BOOTFB resource

sysfb_simplefb.c checks all PCI BARs on all VGA devices and adjust the resource
to match the BAR in which the original area from screen_info is located. 
Please test.  I'm not sure why nouveau hangs in your case.  It doesn't hang for
me even if it shows the stack trace.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380295699.05142.27392
Date: Fri, 27 Sep 2013 15:28:19 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488">bug 69488</a>
              from <span class="vcard"><a class="email" href="mailto:proski&#64;gnu.org" title="Pavel Roskin &lt;proski&#64;gnu.org&gt;"> <span class="fn">Pavel Roskin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=86729" name="attach_86729" title="better patch for sysfb_simplefb that adjusts the BOOTFB resource">attachment 86729</a> <a href="attachment.cgi?id=86729&amp;action=edit" title="better patch for sysfb_simplefb that adjusts the BOOTFB resource">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=69488&amp;attachment=86729'>[review]</a>
better patch for sysfb_simplefb that adjusts the BOOTFB resource

sysfb_simplefb.c checks all PCI BARs on all VGA devices and adjust the resource
to match the BAR in which the original area from screen_info is located. 
Please test.  I'm not sure why nouveau hangs in your case.  It doesn't hang for
me even if it shows the stack trace.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380295699.05142.27392--

--===============1654714143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1654714143==--
