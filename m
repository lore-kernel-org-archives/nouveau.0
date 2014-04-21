From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77724] error: GLSL ES 3.00 is not supported.
 Supported versions are: 1.00 ES
Date: Mon, 21 Apr 2014 10:32:40 +0000
Message-ID: <bug-77724-8800-HG9Sy3oAmF@http.bugs.freedesktop.org/>
References: <bug-77724-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1873101762=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77724-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1873101762==
Content-Type: multipart/alternative; boundary="1398076360.BdB00.19956"; charset="us-ascii"


--1398076360.BdB00.19956
Date: Mon, 21 Apr 2014 10:32:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77724

Rohit Nandan <pulkitnandan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pulkitnandan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Rohit Nandan <pulkitnandan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
this is the error trace with powervr sdk.
les3-book/build$ Chapter_2/Hello_Triangle/./Hello_Triangle 
libGL: OpenDriver: trying /home/rnandan/install/lib/dri/nouveau_dri.so
libGL: driver does not expose __driDriverGetExtensions_nouveau():
/home/rnandan/install/lib/dri/nouveau_dri.so: undefined symbol:
__driDriverGetExtensions_nouveau
libGL: Can't open configuration file /home/rnandan/.drirc: No such file or
directory.
libGL: Can't open configuration file /home/rnandan/.drirc: No such file or
directory.
(Error) There is no context bound to the current thread.
(Error) There is no context bound to the current thread.
(Error) There is no context bound to the current thread.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398076360.BdB00.19956
Date: Mon, 21 Apr 2014 10:32:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:pulkitnandan&#64;gmail.com" title="Rohit Nandan &lt;pulkitnandan&#64;gmail.com&gt;"> <span class="fn">Rohit Nandan</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - error: GLSL ES 3.00 is not supported. Supported versions are: 1.00 ES"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77724">bug 77724</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>pulkitnandan&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - error: GLSL ES 3.00 is not supported. Supported versions are: 1.00 ES"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77724#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - error: GLSL ES 3.00 is not supported. Supported versions are: 1.00 ES"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77724">bug 77724</a>
              from <span class="vcard"><a class="email" href="mailto:pulkitnandan&#64;gmail.com" title="Rohit Nandan &lt;pulkitnandan&#64;gmail.com&gt;"> <span class="fn">Rohit Nandan</span></a>
</span></b>
        <pre>this is the error trace with powervr sdk.
les3-book/build$ Chapter_2/Hello_Triangle/./Hello_Triangle 
libGL: OpenDriver: trying /home/rnandan/install/lib/dri/nouveau_dri.so
libGL: driver does not expose __driDriverGetExtensions_nouveau():
/home/rnandan/install/lib/dri/nouveau_dri.so: undefined symbol:
__driDriverGetExtensions_nouveau
libGL: Can't open configuration file /home/rnandan/.drirc: No such file or
directory.
libGL: Can't open configuration file /home/rnandan/.drirc: No such file or
directory.
(Error) There is no context bound to the current thread.
(Error) There is no context bound to the current thread.
(Error) There is no context bound to the current thread.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398076360.BdB00.19956--

--===============1873101762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1873101762==--
