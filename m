From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71172] Segfault when running glxinfo. NV25GL
	[Quadro4 900 XGL]
Date: Sat, 02 Nov 2013 21:01:31 +0000
Message-ID: <bug-71172-8800-eIDo8MERIi@http.bugs.freedesktop.org/>
References: <bug-71172-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0394417305=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71172-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0394417305==
Content-Type: multipart/alternative; boundary="1383426091.50Cee3e1.13800"; charset="us-ascii"


--1383426091.50Cee3e1.13800
Date: Sat, 2 Nov 2013 21:01:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71172

--- Comment #3 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> ---
Created attachment 88537
  --> https://bugs.freedesktop.org/attachment.cgi?id=88537&action=edit
nouveau_dri_screen_init_breakage.patch

Can you try the attached patch on Mesa master?

Thank you.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383426091.50Cee3e1.13800
Date: Sat, 2 Nov 2013 21:01:31 +0000
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
   title="NEW --- - Segfault when running glxinfo. NV25GL [Quadro4 900 XGL]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71172#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Segfault when running glxinfo. NV25GL [Quadro4 900 XGL]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71172">bug 71172</a>
              from <span class="vcard"><a class="email" href="mailto:currojerez&#64;riseup.net" title="Francisco Jerez &lt;currojerez&#64;riseup.net&gt;"> <span class="fn">Francisco Jerez</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=88537" name="attach_88537" title="nouveau_dri_screen_init_breakage.patch">attachment 88537</a> <a href="attachment.cgi?id=88537&amp;action=edit" title="nouveau_dri_screen_init_breakage.patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=71172&amp;attachment=88537'>[review]</a>
nouveau_dri_screen_init_breakage.patch

Can you try the attached patch on Mesa master?

Thank you.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383426091.50Cee3e1.13800--

--===============0394417305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0394417305==--
