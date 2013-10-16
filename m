From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70510] Xorg crash on KDE init
Date: Wed, 16 Oct 2013 18:19:20 +0000
Message-ID: <bug-70510-8800-V4ZwaIxZ9D@http.bugs.freedesktop.org/>
References: <bug-70510-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1118105771=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70510-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1118105771==
Content-Type: multipart/alternative; boundary="1381947560.eab083c1.17924"; charset="us-ascii"


--1381947560.eab083c1.17924
Date: Wed, 16 Oct 2013 18:19:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70510

--- Comment #10 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
 Unfortunately that did not work as expected:
> osc getbinaries openSUSE:13.1 $PACKAGE standard $ARCHITECTURE $FILE
gives me the error message: Need either 1, 2 or 4 arguments (seems not
implemented)
> osc getbinaries openSUSE:13.1 $PACKAGE standard $ARCHITECTURE
however re-downloads the whole package which can be installed via
> rpm -Uvh --force $PACKAGE
Nonetheless this does not give me debuginfo yet.
If I do an nm -s on the specified files it returns 'no symbols'; an rpm -ql
shows that these packages do also not contain external debuginfo.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381947560.eab083c1.17924
Date: Wed, 16 Oct 2013 18:19:20 +0000
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
   title="NEW --- - Xorg crash on KDE init"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70510#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xorg crash on KDE init"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70510">bug 70510</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre> Unfortunately that did not work as expected:
<span class="quote">&gt; osc getbinaries openSUSE:13.1 $PACKAGE standard $ARCHITECTURE $FILE</span >
gives me the error message: Need either 1, 2 or 4 arguments (seems not
implemented)
<span class="quote">&gt; osc getbinaries openSUSE:13.1 $PACKAGE standard $ARCHITECTURE</span >
however re-downloads the whole package which can be installed via
<span class="quote">&gt; rpm -Uvh --force $PACKAGE</span >
Nonetheless this does not give me debuginfo yet.
If I do an nm -s on the specified files it returns 'no symbols'; an rpm -ql
shows that these packages do also not contain external debuginfo.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381947560.eab083c1.17924--

--===============1118105771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1118105771==--
