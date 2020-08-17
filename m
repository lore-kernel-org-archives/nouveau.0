From: Andrew Randrianasulu <randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: qemu -display sdl,gl=on also eats CPU
Date: Mon, 17 Aug 2020 07:42:41 +0300
Message-ID: <202008170742.42032.randrianasulu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I was testing Ilia's patches for ddx, and while they definitely helped for Xorg itself, 
qemu still eats a lot of CPU if launched like this

qemu-system-x86_64 -cdrom ~/Downloads/ISO/slax-English-US-7.0.8-x86_64.iso -m 1G -display sdl,gl=on -enable-kvm

and left for few hours.

top - 07:38:01 up 18:05,  2 users,  load average: 2,00, 1,89, 1,83
Tasks: 224 total,   3 running, 221 sleeping,   0 stopped,   0 zombie
%Cpu(s): 40,6 us,  6,1 sy,  0,3 ni, 49,2 id,  0,8 wa,  0,0 hi,  2,9 si,  0,0 st
MiB Mem :  11875,3 total,   3535,7 free,   3339,3 used,   5000,3 buff/cache
MiB Swap:   1145,0 total,   1131,2 free,     13,8 used.   4874,7 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 6215 guest     20   0 1455160 951768  45560 R  99,3   7,8 710:44.44 qemu-system-x86
12655 guest     20   0 2459848   1,5g 126708 R  59,1  12,6 217:53.21 seamonkey
 1991 root      20   0  178112 109500  28840 S  20,9   0,9 187:20.05 Xorg
 2068 guest     20   0  104932  51660  30764 S   5,6   0,4  54:08.99 ktorrent
 6031 root      20   0       0      0      0 I   2,0   0,0   0:20.24 kworker/0:3-events
 3697 guest     20   0  382432  20308  13696 S   1,7   0,2  91:38.13 xmms
 2064 guest     20   0   55868  37048  23976 S   1,3   0,3   2:38.47 konsole
 2319 guest     20   0   40160  21248  18548 S   1,3   0,2  12:36.63 gkrellm
 5853 root      20   0       0      0      0 I   0,7   0,0   0:07.21 kworker/2:2-events

opreport after  operf --pid 6215 said:

opreport
Using /home/guest/botva/src/xf86-video-nouveau/oprofile_data/samples/ for samples directory.
CPU: AMD64 family15h, speed 3800 MHz (estimated)
Counted CPU_CLK_UNHALTED events (CPU Clocks not Halted) with a unit mask of 0x00 (No unit mask) count 100000
CPU_CLK_UNHALT...|
  samples|      %|
------------------
   260163 100.000 qemu-system-x86_64
        CPU_CLK_UNHALT...|
          samples|      %|
        ------------------
           144120 55.3960 nouveau_dri.so
            87990 33.8211 libdrm_nouveau.so.2.0.0
            11783  4.5291 libpixman-1.so.0.38.0
             7884  3.0304 kallsyms
             5310  2.0410 libc-2.30.so
              689  0.2648 ld-2.30.so
              519  0.1995 nouveau
              501  0.1926 qemu-system-x86_64
              456  0.1753 ttm
              239  0.0919 kvm
              211  0.0811 kvm_amd
               81  0.0311 libpthread-2.30.so
               76  0.0292 drm
               49  0.0188 libSDL2-2.0.so.0.12.0
               43  0.0165 libxcb.so.1.1.0
               36  0.0138 libGL.so.1.2.0
               31  0.0119 libX11.so.6.3.0
               24  0.0092 snd_pcm
               23  0.0088 snd_hda_codec
               20  0.0077 libglib-2.0.so.0.5800.1
               11  0.0042 snd_timer
                9  0.0035 libglapi.so.0.0.0
                8  0.0031 libdrm.so.2.4.0
                7  0.0027 snd_aloop
                7  0.0027 snd_hda_intel
                7  0.0027 libxshmfence.so.1.0.0
                7  0.0027 libgcc_s.so.1
                5  0.0019 [vdso] (tgid:6215 range:0xf7f9f000-0xf7f9ffff)
                5  0.0019 snd_hda_core
                4  0.0015 r8169
                3  0.0012 libahci
                2 7.7e-04 ohci_hcd
                2 7.7e-04 libxcb-present.so.0.0.0
                1 3.8e-04 libatomic.so.1.1.0

so, may be similar fix needed for mesa, too?

ow, I started it in ddx src directory :} need to cleanup there. But at least data is 100
