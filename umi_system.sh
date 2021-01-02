#! /vendor/bin/sh
# Copyright (C) 2016-2019, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# 禁用磁盘I/O统计 (UFS)
echo "0" > /sys/block/sda/queue/iostats
echo "0" > /sys/block/sdb/queue/iostats
echo "0" > /sys/block/sdc/queue/iostats
echo "0" > /sys/block/sdd/queue/iostats
echo "0" > /sys/block/sde/queue/iostats
echo "0" > /sys/block/sdf/queue/iostats

# 禁用binder调试
echo "0" > /sys/module/binder/parameters/debug_mask
echo "0" > /sys/module/binder_alloc/parameters/debug_mask

# 禁用内核调试
echo "0" > /sys/module/msm_show_resume_irq/parameters/debug_mask
echo "0" > /sys/module/millet_core/parameters/millet_debug
echo "0" > /sys/kernel/iolimit/debug
echo "0" > /sys/kernel/mi_reclaim/debug
echo "0" > /proc/sys/migt/migt_sched_debug
echo "N" > /sys/kernel/debug/debug_enabled

# 开启小米优化功能
echo "1" > /sys/kernel/mi_reclaim/enable
echo "1" > /sys/kernel/iolimit/enable
echo "11" > /proc/sys/kernel/mi_iolimit

# F2FS MIN FSYNC (可能没效果,如果是官改包这里会提示error)
echo "20" > /sys/fs/f2fs/dm-4/min_fsync_blocks

# F2FS 垃圾回收 (实验性项目,默认使用#号屏蔽,如果想尝鲜可以把#号删除,但可能会带来性能损失以及续航问题.)
# echo "30000" > /sys/fs/f2fs/dm-4/gc_max_sleep_time
# echo "3000" > /sys/fs/f2fs/dm-4/gc_min_sleep_time
# echo "120000" > /sys/fs/f2fs/dm-4/gc_no_gc_sleep_time

# 删除不必要网络日志 (位于/data/vendor/wifi_logs)
stop cnss_diag
