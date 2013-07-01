From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66255] Enabling Xinerama with nouveau driver causes
 Segmentation fault
Date: Mon, 01 Jul 2013 16:07:46 +0000
Message-ID: <bug-66255-8800-zD3UWOtz9f@http.bugs.freedesktop.org/>
References: <bug-66255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1007738579=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1007738579==
Content-Type: multipart/alternative; boundary="1372694866.B83D1.10185"; charset="us-ascii"


--1372694866.B83D1.10185
Date: Mon, 1 Jul 2013 16:07:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66255

--- Comment #14 from Trev Jackson <trev.g7pvs-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> ---
Hi

I'm not sure about this - I've not done any C programming for a long time, the
bit of code below from panoramiXprocs.c line 1837 where it has:
y < -wBorderWidth((WindowPtr)pDraw)
is there supposed to be a gap between the - symbol and the function?
wBorderWidth call and if so is that likely to cause a problem?

Trev

      if( /* check for being onscreen */
screenInfo.screens[0]->x + pDraw->x + x < 0 ||
screenInfo.screens[0]->x + pDraw->x + x + w > PanoramiXPixWidth ||
screenInfo.screens[0]->y + pDraw->y + y < 0 ||
screenInfo.screens[0]->y + pDraw->y + y + h > PanoramiXPixHeight ||
/* check for being inside of border */
        x < - wBorderWidth((WindowPtr)pDraw) ||
x + w > wBorderWidth((WindowPtr)pDraw) + (int)pDraw->width ||
y < -wBorderWidth((WindowPtr)pDraw) ||
y + h > wBorderWidth ((WindowPtr)pDraw) + (int)pDraw->height)
return BadMatch;
    }

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372694866.B83D1.10185
Date: Mon, 1 Jul 2013 16:07:46 +0000
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
   title="NEW --- - Enabling Xinerama with nouveau driver causes Segmentation fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Enabling Xinerama with nouveau driver causes Segmentation fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255">bug 66255</a>
              from <span class="vcard"><a class="email" href="mailto:trev.g7pvs&#64;ntlworld.com" title="Trev Jackson &lt;trev.g7pvs&#64;ntlworld.com&gt;"> <span class="fn">Trev Jackson</span></a>
</span></b>
        <pre>Hi

I'm not sure about this - I've not done any C programming for a long time, the
bit of code below from panoramiXprocs.c line 1837 where it has:
y &lt; -wBorderWidth((WindowPtr)pDraw)
is there supposed to be a gap between the - symbol and the function?
wBorderWidth call and if so is that likely to cause a problem?

Trev

      if( /* check for being onscreen */
screenInfo.screens[0]-&gt;x + pDraw-&gt;x + x &lt; 0 ||
screenInfo.screens[0]-&gt;x + pDraw-&gt;x + x + w &gt; PanoramiXPixWidth ||
screenInfo.screens[0]-&gt;y + pDraw-&gt;y + y &lt; 0 ||
screenInfo.screens[0]-&gt;y + pDraw-&gt;y + y + h &gt; PanoramiXPixHeight ||
/* check for being inside of border */
        x &lt; - wBorderWidth((WindowPtr)pDraw) ||
x + w &gt; wBorderWidth((WindowPtr)pDraw) + (int)pDraw-&gt;width ||
y &lt; -wBorderWidth((WindowPtr)pDraw) ||
y + h &gt; wBorderWidth ((WindowPtr)pDraw) + (int)pDraw-&gt;height)
return BadMatch;
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

--1372694866.B83D1.10185--

--===============1007738579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1007738579==--
