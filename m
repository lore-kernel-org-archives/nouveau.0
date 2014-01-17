From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Fri, 17 Jan 2014 16:10:00 +0000
Message-ID: <bug-73358-8800-e5mOFVFCA3@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1229065855=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73358-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1229065855==
Content-Type: multipart/alternative; boundary="1389975000.1eAa362.12771"; charset="us-ascii"


--1389975000.1eAa362.12771
Date: Fri, 17 Jan 2014 16:10:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #26 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #24)
> @Ilia Mirkin
> 
> Did this:
> 
> git clone git://anongit.freedesktop.org/mesa/mesa mesa
> cd mesa
> git checkout mesa-10.0.2
> wget http://patchwork.freedesktop.org/patch/18063/raw/ -O ../patch_2.txt
> patch -p1 < ../patch_2.txt
> ./autogen.sh --with-gallium-drivers=nouveau --enable-shared-glapi
> --enable-texture-float --enable-vdpau --disable-egl --enable-dri
> --disable-dri3 --disable-gbm --disable-xvmc --with-dri-drivers=nouveau
> make
> 
> export LD_LIBRARY_PATH=./lib/gallium/:$LD_LIBRARY_PATH
> export LIBGL_DRIVERS_PATH=./lib/gallium/
> chromium
> --ppapi-flash-path=/home/gebruiker/Documenten/Ronald/flash/libgcflashplayer-
> 11.2.202.235-19.0.1084.46-135956.so

I think you meant to say LD_LIBRARY_PATH=./lib

Also, since I'm pretty sure that this is all caused by vdpau, in order for it
to use the libvdpau_nouveau.so that you generated, you need to have a libvdpau
in that *same* lib directory. Otherwise it'll get loaded from a fixed path.
(You can run strace -f -e open to confirm.)

> 
> Youtube still shows a garbled video like in comment #23 . Furthermore, dmesg
> fills with errors once again:
> 
> [ 8569.194470] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[578]] subc 7
> class 0x0697 mthd 0x0208 data 0x00000120
> [ 8569.194563] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
> nstatus: BAD_ARGUMENT
> [ 8569.194574] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[578]] subc 7
> class 0x0697 mthd 0x0208 data 0x00000120

Mind testing out http://patchwork.freedesktop.org/patch/18063/ ? (Note, again,
make _sure_ that the 'new' version of libvdpau_nouveau.so is being loaded, not
the old one.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389975000.1eAa362.12771
Date: Fri, 17 Jan 2014 16:10:00 +0000
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
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73358#c24">comment #24</a>)
<span class="quote">&gt; &#64;Ilia Mirkin
&gt; 
&gt; Did this:
&gt; 
&gt; git clone git://anongit.freedesktop.org/mesa/mesa mesa
&gt; cd mesa
&gt; git checkout mesa-10.0.2
&gt; wget <a href="http://patchwork.freedesktop.org/patch/18063/raw/">http://patchwork.freedesktop.org/patch/18063/raw/</a> -O ../patch_2.txt
&gt; patch -p1 &lt; ../patch_2.txt
&gt; ./autogen.sh --with-gallium-drivers=nouveau --enable-shared-glapi
&gt; --enable-texture-float --enable-vdpau --disable-egl --enable-dri
&gt; --disable-dri3 --disable-gbm --disable-xvmc --with-dri-drivers=nouveau
&gt; make
&gt; 
&gt; export LD_LIBRARY_PATH=./lib/gallium/:$LD_LIBRARY_PATH
&gt; export LIBGL_DRIVERS_PATH=./lib/gallium/
&gt; chromium
&gt; --ppapi-flash-path=/home/gebruiker/Documenten/Ronald/flash/libgcflashplayer-
&gt; 11.2.202.235-19.0.1084.46-135956.so</span >

I think you meant to say LD_LIBRARY_PATH=./lib

Also, since I'm pretty sure that this is all caused by vdpau, in order for it
to use the libvdpau_nouveau.so that you generated, you need to have a libvdpau
in that *same* lib directory. Otherwise it'll get loaded from a fixed path.
(You can run strace -f -e open to confirm.)

<span class="quote">&gt; 
&gt; Youtube still shows a garbled video like in <a href="show_bug.cgi?id=73358#c23">comment #23</a> . Furthermore, dmesg
&gt; fills with errors once again:
&gt; 
&gt; [ 8569.194470] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[578]] subc 7
&gt; class 0x0697 mthd 0x0208 data 0x00000120
&gt; [ 8569.194563] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
&gt; nstatus: BAD_ARGUMENT
&gt; [ 8569.194574] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [chromium[578]] subc 7
&gt; class 0x0697 mthd 0x0208 data 0x00000120</span >

Mind testing out <a href="http://patchwork.freedesktop.org/patch/18063/">http://patchwork.freedesktop.org/patch/18063/</a> ? (Note, again,
make _sure_ that the 'new' version of libvdpau_nouveau.so is being loaded, not
the old one.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389975000.1eAa362.12771--

--===============1229065855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1229065855==--
