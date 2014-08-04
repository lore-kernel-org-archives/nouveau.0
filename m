From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82152] [NVE7] NULL deref when putting card back to
 sleep after unsuccessful init (HUB_INIT timeout)
Date: Mon, 04 Aug 2014 22:36:38 +0000
Message-ID: <bug-82152-8800-UIVcgU11rd@http.bugs.freedesktop.org/>
References: <bug-82152-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1750096772=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82152-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1750096772==
Content-Type: multipart/alternative; boundary="1407191798.bBe60.23058"; charset="us-ascii"


--1407191798.bBe60.23058
Date: Mon, 4 Aug 2014 22:36:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82152

--- Comment #7 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
If i look at the system + the kernel bug, this looks similar to a problem i was
facing some weeks ago:

so i'd suggest to try DRI3 with the whole package:

Update your packages:
xf86-video-intel
mesa
(all dependencies of course)
Remove:
xf86-video-nouveau (with DRI3 you wont need it to do: DRI_PRIME=1 myprog)


you'll need a kernel with rendernodes enabled (boot with drm.rnodes=1)
you may need to add a file to /etc/udev/rules.d/ containing:

SUBSYSTEM=="drm", IMPORT{builtin}="path_id" 

to get ID_PATH tags for rendernodes.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407191798.bBe60.23058
Date: Mon, 4 Aug 2014 22:36:38 +0000
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
   title="NEW --- - [NVE7] NULL deref when putting card back to sleep after unsuccessful init (HUB_INIT timeout)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82152#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] NULL deref when putting card back to sleep after unsuccessful init (HUB_INIT timeout)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82152">bug 82152</a>
              from <span class="vcard"><a class="email" href="mailto:tobias.klausmann&#64;mni.thm.de" title="Tobias Klausmann &lt;tobias.klausmann&#64;mni.thm.de&gt;"> <span class="fn">Tobias Klausmann</span></a>
</span></b>
        <pre>If i look at the system + the kernel bug, this looks similar to a problem i was
facing some weeks ago:

so i'd suggest to try DRI3 with the whole package:

Update your packages:
xf86-video-intel
mesa
(all dependencies of course)
Remove:
xf86-video-nouveau (with DRI3 you wont need it to do: DRI_PRIME=1 myprog)


you'll need a kernel with rendernodes enabled (boot with drm.rnodes=1)
you may need to add a file to /etc/udev/rules.d/ containing:

SUBSYSTEM==&quot;drm&quot;, IMPORT{builtin}=&quot;path_id&quot; 

to get ID_PATH tags for rendernodes.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407191798.bBe60.23058--

--===============1750096772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1750096772==--
